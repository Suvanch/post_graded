import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'studentObject.dart';

/*
I need to figure out how to update cumulative gpa as the sutdent removes
it from the list
The text is in MyApp and the is change is made in previousSemesterListView
they are in different classes
*/




//public variables
studentObject student1 = new studentObject();
double currentGpa = student1.getCurrentGPA();
double cummulGpa = student1.getCumulativeGpa();
//main file runs graded app
void main() => runApp(gradedApp());

//only runs one class but it could run more
class gradedApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
}

//the actual app so far
class MyApp extends State<gradedApp> {
  //changes cumulative gpa
  void _changeCumulativeGpa() {
    setState(() => cummulGpa);
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title bar on top
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('GradedApp'),
          ),
        ),
        //rest of the body
        body: Column(
          children: <Widget>[
            //an attept to center the title row
            //spoiler doesnt work
            Center(
              //current semester title with button
              child: Row(
                children: <Widget>[
                  //the title
                  Container(
                    child: Text(
                      "Current Semester",
                      textAlign: TextAlign.center,
                      textScaleFactor: 2,
                    ),
                  ),
                  //the button
                  IconButton(
                    icon: Icon(
                        appBarIcons(title: 'Refresh', icon: Icons.autorenew)
                            .icon),
                    onPressed: () {
                      print("ye i clicke it");
                    },
                  ),
                ],
              ),
            ),
            //the current semester listview
            Expanded(child: currentSemesterListView()),
            //the title for previous semesters
            //properly centered
            //I still have to add a button to create new semester
            Center(
              child: Text(
                "Previous Semester",
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              ),
            ),
            //the previouse semester listview
            Expanded(child: previousSemesterListView()),
            //holds all the gpa's on the bottom
            Row(
              children: <Widget>[
                //box for cummulative gpa
                Card(
                  child: Container(
                    //rounding of the boxes
                    decoration: new BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(30))),
                    width: 190,
                    //the title text with padding to move the text arround for fun
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
                          child: Text(
                            "Cumulative GPA",
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //the gpa text with padding to move the text arround for fun
                        Padding(
                          padding: EdgeInsets.fromLTRB(35.0, 0.0, 32.0, 16.0),
                          child: Text(
                            cummulGpa.toString(),
                            textScaleFactor: 2.0,
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
                        color: Colors.blueAccent,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(30))),
                    width: 190,
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 32.0, 0.0),
                          child: Text(
                            " Current GPA ",
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 32.0, 16.0),
                          child: Text(
                            currentGpa.toString(),
                            textScaleFactor: 2.0,
                          ),
                        )
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
  static Map nug = student1.getCurrentSemester();
  //int lengths = nug.length;

  //adds the colums in the listview
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nug.length,
      itemBuilder: (BuildContext context, int index) {
        String key = nug.keys.elementAt(index);
        //tells what each colum should look like
        return Container(
          //rounded edges
          decoration: new BoxDecoration(
              color: changeGradeColor(nug[key]).color,
              borderRadius: new BorderRadius.all(Radius.circular(15))),
          height: 50,
          //color: Colors.amber[600],
          child: Card(
            color: changeGradeColor(nug[key]).color,
            child: Row(
              children: <Widget>[
                //for the name
                Card(
                  child: Container(
                    height: 49,
                    width: 300,
                    //color: Colors.grey,myBgColors[1].color,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        key,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    alignment: Alignment(-1.0, 0.0),
                  ),
                ),
                //for the grade
                Card(
                  child: Container(
                    height: 49,
                    width: 75,
                    //color: changeGradeColor(nug[key]).color,
                    child: Text(
                      nug[key].toString(),
                    ),
                    alignment: Alignment(0.0, 0.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class previousSemesterListView extends StatelessWidget {
  @override
  static Map nug = student1.getPreviousSemester();

  //print(lengths);
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nug.length,
      itemBuilder: (BuildContext context, int index) {
        String key = nug.keys.elementAt(index);
        return Dismissible(
          key: new Key(key),
          onDismissed: (direction) {
            nug.remove(key);
            Scaffold.of(context).showSnackBar(
                new SnackBar(content: new Text("Removed Semester")));

          },
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon(Icons.delete,color: Colors.white,),
          ),
          direction: DismissDirection.endToStart,
          child: Container(
            height: 50,
            decoration: new BoxDecoration(
              color: changeGpaColor(nug[key]).color,
              borderRadius: new BorderRadius.all(Radius.circular(15.0)),
            ),
            //color: Colors.amber[600],
            child: Card(
              color: changeGpaColor(nug[key]).color,
              child: Row(
                children: <Widget>[
                  Card(
                    child: Container(
                      height: 49,
                      width: 300,
                      color: changeGpaColor(nug[key]).color,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          key,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      alignment: Alignment(-1.0, 0.0),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 49,
                      width: 75,
                      color: changeGpaColor(nug[key]).color,
                      child: Text(
                        nug[key].toString(),
                      ),
                      alignment: Alignment(0.0, 0.0),
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
  if (grade > 90) {
    return myBgColors[1];
  } else if (grade > 80) {
    return myBgColors[2];
  } else if (grade > 70) {
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
    const _MyColor(const Color(0xFFC6FF00), 'LightGreen'),
    const _MyColor(const Color(0xFFFFFF00), 'Yellow'),
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



