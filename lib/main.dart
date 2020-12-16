import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:postgraded/settingsPage.dart';
import 'studentObject.dart';
import 'add_new_semester.dart';
import 'add_new_class.dart';
import 'one_class.dart';


/*
I need to figure out how to update cumulative gpa as the sutdent removes
it from the list
The text is in MyApp and the is change is made in previousSemesterListView
they are in different classes
*/

//public variables
studentObject student1 = new studentObject();

//only runs one class but it could run more
class gradedApp extends StatefulWidget {
  gradedApp({Key key, @required student1}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>MyApp(student1);
}
/*
class MyApp  extends State<gradedApp>{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: HomeScreen());
  }
}
 */
//the actual app so far
class MyApp  extends State<gradedApp> {
  //changes cumulative gpa
  double currentGpa = student1.getCurrentGPA();
  String cummulGpa = student1.getCumulativeGpa().toString();
  MyApp(student1);
  callback(newCummulGpa) {
    setState(() {
      cummulGpa = newCummulGpa;
    });
  }

  //UI
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: new Scaffold(
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.grey.shade200,
            leading: IconButton(icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => settingsPage()));
                }
            ),
            title: Center(
              child:  Row(
                  children: [
              Padding(
                padding: EdgeInsets.fromLTRB(80.0, 0.0, 0.0, 0.0),
                child: Text('GradePost',textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
              ),]
              ),
            ),
            actions: <Widget>[IconButton(
              icon: Icon(
                  appBarIcons(title: 'Refresh', icon: Icons.autorenew)
                      .icon),
              onPressed: () {
                print("Ye click it");
              },
            ),],
            automaticallyImplyLeading: false,
          ),//rest of the body
          body: Column(
            children: <Widget>[
              //an attept to center the title row
              //spoiler doesnt work
              Center(
                //current semester title with button
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //the title
                    Container(
                      child: Text(
                        "Current Semester",
                        textAlign: TextAlign.center,
                        textScaleFactor: 2,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          appBarIcons(title: 'AddClass', icon: Icons.add)
                              .icon),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => addNewClass(student1:student1)));
                      },
                    ),
                    //the button
                  ],
                ),
              ),
              //the current semester listview
             Expanded(child: currentSemesterListView()),
              //currentSemesterListView(),
              //the title for previous semesters
              //properly centered
              //I still have to add a button to create new semester
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Previous Semester",
                      textAlign: TextAlign.center,
                      textScaleFactor: 2,
                    ),
                    IconButton(
                      icon: Icon(
                          appBarIcons(title: 'AddSemester', icon: Icons.add)
                              .icon),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => addNewSemester(student1:student1)));
                      },
                    ),
                  ],
                ),
              ),
              //the previouse semester listview
              Expanded(child: previousSemesterListView(cummulGpa, callback)),
              //holds all the gpa's on the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //box for cummulative gpa
                  Card(
                    child: Container(
                      //rounding of the boxes
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          new BorderRadius.all(Radius.circular(30))),
                      width: width/2.5,
                      height: height/9,
                      //the title text with padding to move the text arround for fun
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(25.0, 20.0, 32.0, 0.0),
                            child: Text(
                              "Overall GPA",
                              textScaleFactor: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blueAccent
                              ),
                            ),
                          ),
                          //the gpa text with padding to move the text arround for fun
                          Padding(
                            padding: EdgeInsets.fromLTRB(35.0, 0.0, 32.0, 16.0),
                            child: Text(
                              cummulGpa.toString(),
                              textScaleFactor: 1.4,

                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //same as the card before
                  Card(
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          new BorderRadius.all(Radius.circular(30))),
                      width: width/2.5,
                      height: height/9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(25.0, 20.0, 32.0, 0.0),
                            child: Text(
                              " Current GPA ",
                              textScaleFactor: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blueAccent
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 0.0, 32.0, 16.0),
                            child: Text(
                              currentGpa.toString(),
                              textScaleFactor: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

      ),
    );
  }
}

//I think this is useless but im not sure
class appBarIcons {
  const appBarIcons({this.title, this.icon});
  final String title;
  final IconData icon;
}

//the list view for the current semester
class currentSemesterListView extends StatelessWidget {
  @override

  //sets the student map to nug
  //its not neccssay and should be changes

  //int lengths = nug.length;

  //adds the colums in the listview
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: student1.getCurrentSemester().length,
      itemBuilder: (BuildContext context, int index) {

        String key = student1.getCurrentSemester().keys.elementAt(index);
        //tells what each colum should look like
        return InkWell(
          child: Container(
            //rounded edges
            height: 50,
            //color: Colors.amber[600],
            child: Card(
              color: changeGradeColor(student1.getCurrentSemester()[key].grade).color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //for the name
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      key,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  //for the grade
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      student1.getCurrentSemester()[key].grade.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => oneClass(student1:student1,name:key)));
          },
        );
      },
    );
  }
}

class previousSemesterListView extends StatefulWidget {
  String cummulGpa;
  Function(String) callback;
  previousSemesterListView(this.cummulGpa, this.callback);

  @override
  _previousSemesterListViewState createState() =>
      new _previousSemesterListViewState();
}

class _previousSemesterListViewState extends State<previousSemesterListView> {
  @override
  static Map nug = student1.getPreviousSemester();

  //print(lengths);
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: student1.getPreviousSemester().length,
      itemBuilder: (BuildContext context, int index) {
        String key = student1.getPreviousSemester().keys.elementAt(index);
        return Dismissible(
          key: new Key(key),
          onDismissed: (direction) {
            student1.removeSemester(key);
            //student1.getPreviousSemester().remove(key);
            //print(student1.getPreviousSemester());
            //Scaffold.of(context).showSnackBar(
            //new SnackBar(content: new Text("Removed Semester")));
            widget.callback(student1.getCumulativeGpa().toString());
          },
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          child: Container(
            height: 50,

            //color: Colors.amber[600],
            child: Card(
              color: changeGpaColor(student1.getPreviousSemester()[key].gpa).color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      key,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      student1.getPreviousSemester()[key].gpa.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  //MyApp createState() => MyApp();
}

//the color class helps chose ccolors but i dont know what it does
class _MyColor {
  const _MyColor(this.color, this.name);

  final Color color;
  final String name;
}

//changes the colors for the current semester
_MyColor changeGradeColor(double grade) {
  const List<_MyColor> myBgColors = const <_MyColor>[
    const _MyColor(null, 'Clear'),
    const _MyColor(const Color(0xFF76FF03), 'Green'),
    const _MyColor(const Color(0xFFC6FF00), 'LightGreen'),
    const _MyColor(const Color(0xFFFFFF00), 'Yellow'),
    const _MyColor(const Color(0xFFFF1744), 'Red'),
  ];
  if (grade >= 90) {
    return myBgColors[1];
  } else if (grade >= 80) {
    return myBgColors[2];
  } else if (grade >= 70) {
    return myBgColors[3];
  } else {
    return myBgColors[4];
  }
}

//changes the colors for the previous semester
_MyColor changeGpaColor(double grade) {
  const List<_MyColor> myBgColors = const <_MyColor>[
    const _MyColor(null, 'Clear'),
    const _MyColor(const Color(0xFF76FF03), 'Green'),
    const _MyColor(const Color(0xFFFFFF00), 'Yellow'),
    const _MyColor(const Color(0xFFFF9100), 'Orange'),
    const _MyColor(const Color(0xFFFF1744), 'Red'),
  ];
  if (grade > 3.0) {
    return myBgColors[1];
  } else if (grade > 2.0) {
    return myBgColors[2];
  } else if (grade > 1.0) {
    return myBgColors[3];
  } else {
    return myBgColors[4];
  }
}
