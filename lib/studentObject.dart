import 'dart:collection';

class studentObject{
  double currentGPA;
  int totalCredits;
  double totalGPAPoints;
  double cumulativeGPA;
  double totalSemesterCredits = 0;
  List classes = new List<classObject>();
  List semesters  = new List<semesterObject>();
  Map<String,double> currentSemester = new Map<String, double>();
  Map<String,double> previousSemester = new Map<String, double>();

   studentObject(){
     addData();
     //print("dfadfasdasdasdasdasdsadas");
   }
   void addClass(String name, String teacher,String location,double grade,int credits){
    classes.add(classObject(name,teacher,location,grade,credits));
    currentSemester[name] = grade;
  }
   double getCurrentGPA(){
    // print("---------------------------------------------------------------------------------------------------");
    calcCurrentGpa();
    //print("---------------------------------------------------------------------------------------------------");
    return this.currentGPA;
  }
   void calcCurrentGpa(){
    // print("---------------------------------------------------------------------------------------------------");
    int totalCredits = 0;
    if (classes.length == 0) {
      this.totalCredits = -1;
    }
    else {
      for (int i = 0; i < classes.length; i++) {
        totalCredits += classes[i].credits;
      }
    }
     //print("1");
    if (totalCredits > 0) {
      this.totalCredits = totalCredits;
    } else {
      this.totalCredits = -1;
    }
     //print("---------------------------------------------------------------------------------------------------");
    double totalPoints=0;
    if (classes.length == 0) {
      this.totalGPAPoints = -1;
      //print("error");
    }
    else {
      //
      for (int i = 0; i < classes.length; i++) {
        //print(i);
       // print(classes.length);
        //System.out.println("gpaPoints: " + classes.get(i).getGPAPoints());
        totalPoints += classes[i].getGPAPoints();
        //print(totalPoints);
      }
    }
     //print("---------------------------------------------------------------------------------------------------");
    if (totalPoints >= 0) {
      this.totalGPAPoints = totalPoints;
    }
    else {
      this.totalGPAPoints = -1;
    }
     //print("---------------------------------------------------------------------------------------------------");
    //System.out.println(totalGPAPoints);
    //System.out.println(totalCredits);
    this.currentGPA =double.parse((totalGPAPoints/totalCredits).toStringAsFixed(4));
    //print(this.currentGPA);
     //print("---------------------------------------------------------------------------------------------------");
  }
   Map<String,double>getCurrentSemester(){
     return currentSemester;
  }
   classObject getClass(String name){
      for(int i=0;i<classes.length;i++){
        if(classes[i].name == name){
          return classes[i];
        }
      }
      return null;
   }
  void addSemester(String name,double grade,int credits){
    previousSemester[name] = grade;
    semesterObject xx = new semesterObject(name, grade, credits);
    semesters.add(xx);
  }
  double getCumulativeGpa(){
    calcCumulativeGpa();
    return this.cumulativeGPA;
  }
  void calcCumulativeGpa(){

     int length = semesters.length;
     double totalCreditPoints = 0;
     int totalCredits =0;
     if(length > 0){
       for(int i=0;i<length;i++){
       totalCreditPoints += semesters[i].getCreditPoints();
       totalCredits += semesters[i].credits;
      }

      cumulativeGPA = double.parse((totalCreditPoints/totalCredits).toStringAsFixed(4));
     }
     else{
       cumulativeGPA = -1;
     }

  }
  void removeSemester(String name){
    previousSemester.remove(name);
    for(int i=0;i<semesters.length;i++){
      if(semesters[i].getName() == name){
        semesters.removeAt(i);
      }
    }
  }
  Map<String,double>getPreviousSemester(){
    return previousSemester;
  }
  void addData(){
    this.addClass("CS1337", "Dr.Kiem Le","CB 134",95.7,3);
    this.addClass("Math2414", "Dr.Mylinh Nguyen","CB 134",84.9,3);
    this.addClass("Ahst2331", "Dr.Charissa Terranova","CB 134",74.6,3);
    this.addClass("Math2414.339", "Dr.Nasrin Sultana","CB 134",94.6,3);
    this.addClass("Math2414.701", "","CB 134",91.6,3);
    this.addSemester("1sem",4.0,15);
    this.addSemester("2sem",3.0,25);
    this.addSemester("3sem",2.0,35);
    this.addSemester("4sem",1.0,55);
    this.classes[0].addDistribution("major",50.0);
    this.classes[0].addDistribution("minor",30.0);
    this.classes[0].addDistribution("daily",20.0);
    //you have to add + 0.0 it causes some stupid problem
    this.classes[0].distribution["major"].addAssignments("test1",33+0.0);
   // this.classes[0].distribution["minor"].addAssignments("quiz1",33+0.0);
  }

}

class semesterObject{
  int credits;
  double gpa;
  double creditPoints;
  String name;

  semesterObject(String name,double grade,int credits){
    this.name = name;
    this.credits = credits;
    this.gpa = grade;
    this.creditPoints = gpa*credits;
  }
  double getCreditPoints(){
    return creditPoints;
  }
  int getCredits(){
    return credits;
  }
  String getName(){
    return name;
  }

}

//all data requried for one class
class classObject{
  String name;
  String teacher;
  String days;
  String time;
  String location;
  double grade;
  int credits;
  Map<String,distributionObject> distribution = new Map<String, distributionObject>();
  double GPAPoints;

  classObject(String name, String teacher,String location,double grade,int credits){
    this.name = name;
    this.teacher = teacher;
    this.location = location;
    this.grade = grade;
    this.credits = credits;
    //distribution["Unsigned"]=distributionObject(100);
  }
  distributionObject getDistribution(String name){
    print(distribution[name]);
    for (var k in distribution.keys) {
      if(k==name){
        return distribution[k];
      }
    }
    return null;

    /*
    distribution.forEach((k,v) {
      if(k==name){
        return distribution[k];
      }
    });
     */

  }
  void addDistribution(String name, double percent){
    distribution[name] = new distributionObject(percent);
  }

  double getGPAPoints(){
    calcGrade();
    calcGPAPoints();
    return this.GPAPoints;
  }
  void calcGPAPoints(){
    if(grade == -1){
      this.GPAPoints = -1.0;
    }
    else if(grade >= 93){
      this.GPAPoints = 4.0*credits;
    }
    else if(grade >= 90){
      this.GPAPoints = 3.7*credits;
    }
    else if(grade >= 87){
      this.GPAPoints = 3.3*credits;
    }
    else if(grade >= 83){
      this.GPAPoints = 3.0*credits;
    }
    else if(grade >= 80){
      this.GPAPoints = 2.7*credits;
    }
    else if(grade >= 77){
      this.GPAPoints = 2.3*credits;
    }
    else if(grade >= 73){
      this.GPAPoints = 2.0*credits;
    }
    else if(grade >= 70){
      this.GPAPoints = 1.7*credits;
    }
    else if(grade >= 67){
      this.GPAPoints = 1.3*credits;
    }
    else if(grade >= 60){
      this.GPAPoints = 1.0*credits;
    }
    else{
      this.GPAPoints = 0.0*credits;
    }
  }
  void calcGrade(){
    double gradePoints =0;
    if(distribution.length ==0){
      this.grade = -1;
    }
    else{
      for (var k in distribution.keys) {
        gradePoints += distribution[k].getWeightAchived();
      }

      if(gradePoints>=0&&gradePoints<= 100){
        this.grade = gradePoints;
      }
      else {
        this.grade =-2;
      }
    }
  }
}

class distributionObject{
  //String name;
  double weight;

  Map<String,double> distributedGrades = new Map<String, double>();

  distributionObject(double weight){
    this.weight = weight;
  }
    double getWeight(){
    //print("yeeeeee");
    return this.weight;
  }
   void addAssignments(String name, double percent){
    //print("*******3  ");
   // print(name);
    //rint(percent);
    distributedGrades[name]=percent;
  }
   double getWeightAchived(){
    double weight;
    double average;
    //if there are no assignments
    if(distributedGrades.length ==0){
      return 0;
    }
    else {
      double a =0;
      //adds up all the grades
      for (var k in distributedGrades.keys) {
        a += distributedGrades[k];
      }

      //if the sum of all the grades is below 0
      if(a < 0){
        return -1;
      }
      //calculate average
      average = a/distributedGrades.length;
    }
    //calculate weight earned
    weight = average*(this.weight/100);
    return weight;
  }


}

class gradeObject{
  String name;
  int day;
  int month;
  int year;
  double percent;

  gradeObject(String name, double percent){
    this.name = name;
    this.percent = percent;
  }

}
