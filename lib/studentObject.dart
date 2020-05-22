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
   }
   void addClass(String name, String teacher,String location,double grade,int credits){
    classObject xx = new classObject(name,teacher,location,grade,credits);
    classes.add(xx);
    currentSemester[name] = grade;
  }
   double getCurrentGPA(){
    calcCurrentGpa();
    return this.currentGPA;

  }
   void calcCurrentGpa(){

    int totalCredits = 0;
    if (classes.length == 0) {
      this.totalCredits = -1;
    }
    else {
      for (int i = 0; i < classes.length; i++) {
        totalCredits += classes[i].getCredits();
      }
    }
    if (totalCredits > 0) {
      this.totalCredits = totalCredits;
    } else {
      this.totalCredits = -1;
    }

    double totalPoints=0;
    if (classes.length == 0) {
      this.totalGPAPoints = -1;
    }
    else {
      for (int i = 0; i < classes.length; i++) {
        //System.out.println("gpaPoints: " + classes.get(i).getGPAPoints());
        totalPoints += classes[i].getGPAPoints();
      }
    }
    if (totalPoints >= 0) {
      this.totalGPAPoints = totalPoints;
    }
    else {
      this.totalGPAPoints = -1;
    }
    //System.out.println(totalGPAPoints);
    //System.out.println(totalCredits);
    this.currentGPA = totalGPAPoints/totalCredits;
  }
   Map<String,double>getCurrentSemester(){
     return currentSemester;
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
       totalCredits += semesters[i].getCredits();
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
    this.addClass("EPICS2200", "Dr.Terrell Bennett","CB 134",64.6,3);
    this.addClass("Math2414.339", "Dr.Nasrin Sultana","CB 134",94.6,3);
    this.addClass("Math2414.701", "","CB 134",91.6,3);
    this.addSemester("1sem",4.0,15);
    this.addSemester("2sem",3.0,25);
    this.addSemester("3sem",2.0,35);
    this.addSemester("4sem",1.0,55);
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
  List distribution = new List<distributionObject>();
  double GPAPoints;

  classObject(String name, String teacher,String location,double grade,int credits){
    this.name = name;
    this.teacher = teacher;
    this.location = location;
    this.grade = grade;
    this.credits = credits;
    addDistribution("  ",100);
  }
  void addDistribution(String name, double percent){
    distributionObject  XX = new distributionObject(name,percent);
    distribution.add(XX);
  }
  void addAssignment(int pos,String name, double percent){
    distribution[pos].setAssignment(name,percent);
  }
  void calcGPAPoints(){
    //calcGrade();
    if(grade == -1){
      this.GPAPoints = -1;
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
  }
  double getGPAPoints(){
    calcGPAPoints();
    return this.GPAPoints;
  }
  void calcGrade(){
    double gradePoints =0;
    if(distribution.length ==0){
      this.grade = -1;
    }
    for(int i=0;i<distribution.length;i++){
      gradePoints += distribution[i].getWeightAchived();
    }
    if(gradePoints>=0&&gradePoints<= 100){
      this.grade = gradePoints;
    }
    else {
      this.grade =-1;
    }

  }
  int getCredits(){
    return this.credits;
  }
  String gerName(){
    return this.name;
  }
  String getTeacher(){
    return this.teacher;
  }
  String getLocation(){
    return this.location;
  }
  double getGrade(){
    calcGrade();
    return this.grade;
  }
}

class distributionObject{
  String name;
  double weight;
  List assignments;

  distributionObject(String name, double weight){
    this.name = name;
    this.weight = weight;
  }
   void setAssignment(String name, double percent){
     gradeObject XX = new gradeObject(name,percent);
    assignments.add(XX);
  }
   double getWeightAchived(){
    double weight;
    double average;
    //if there are no assignments
    if(assignments.length ==0){
      return 0;
    }
    else {
      double a =0;
      //adds up all the grades
      for (int i = 0; i < assignments.length; i++) {
        a += assignments[i].getPercent();
      }
      //if the sum of all the grades is below 0
      if(a < 0){
        return -1;
      }
      //calculate average
      average = a/assignments.length;
    }
    //calculate weight earned
    weight = average*(this.weight/100);
    return weight;
  }

   String getName(){
    return this.name;
  }
   double getWeight(){
    return this.weight;
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

   double getPercent(){
    return percent;
  }

   String getName(){
    return name;
  }

}
