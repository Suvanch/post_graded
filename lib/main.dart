import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'studentObject.dart';

void main() => runApp(gradedApp());
class gradedApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
  //MyApp createState() => MyApp();
}
_MyColor changeGradeColor(double grade) {
    const List<_MyColor> myBgColors = const <_MyColor>[
    const _MyColor(null, 'Clear'),
    const _MyColor(const Color(0xFF76FF03), 'Green'),
      const _MyColor(const Color(0xFFC6FF00), 'LightGreen'),
    const _MyColor(const Color(0xFFFFFF00), 'Yellow'),
    const _MyColor(const Color(0xFFFF1744), 'Red'),
  ];
    if(grade >90){
      return myBgColors[1];
    }
    else if(grade > 80){
      return myBgColors[2];
    }
    else if(grade > 70){
      return myBgColors[3];
    }
    else {
      return myBgColors[4];
    }
  }
_MyColor changeGpaColor(double grade) {
  const List<_MyColor> myBgColors = const <_MyColor>[
    const _MyColor(null, 'Clear'),
    const _MyColor(const Color(0xFF76FF03), 'Green'),
    const _MyColor(const Color(0xFFC6FF00), 'LightGreen'),
    const _MyColor(const Color(0xFFFFFF00), 'Yellow'),
    const _MyColor(const Color(0xFFFF1744), 'Red'),

  ];
  if(grade >3.0){
    return myBgColors[1];
  }
  else if(grade > 2.0){
    return myBgColors[2];
  }
  else if(grade > 1.0){
    return myBgColors[3];
  }
  else {
    return myBgColors[4];
  }
}
 studentObject student1 = new studentObject();

class MyApp extends State<gradedApp> {

  double currentGpa = student1.getCurrentGPA();
  double cummulGpa = student1.getCumulativeGpa();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('GradedApp'),
          ),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Current Semester",
                      textAlign: TextAlign.center,
                      textScaleFactor: 2,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                        appBarIcons(title: 'Refresh', icon: Icons.autorenew).icon),
                    onPressed: () {
                      print("ye i clicke it");
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: currentSemesterListView()
            ),
            Center(
              child: Text(
                "Previous Semester",
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              ),
            ),
            Expanded(
              child: previousSemesterListView()),
            Row(
              children: <Widget>[
                Card(
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: new BorderRadius.all(Radius.circular(30))
                    ),
                    width: 190,
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
                Card(
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: new BorderRadius.all(Radius.circular(30))
                    ),
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

class appBarIcons {
  const appBarIcons({this.title, this.icon});

  final String title;
  final IconData icon;
}
class currentSemesterListView extends StatelessWidget {
  @override
  //Map nug = {"Cs1337":99.5,"Math2414":85.3,"AHST":77.0,"AHSmmT":60.0,"Nug":90.0};
  static Map nug = student1.getCurrentSemester();
  //int lengths = nug.length;

  //print(lengths);
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: nug.length,
        itemBuilder: (BuildContext context, int index){
          String key = nug.keys.elementAt(index);
          return new Container(
              height: 50,
              //color: Colors.amber[600],
              child:Row(
              children: <Widget>[
              Card(

                child: Container(

                  height: 49,
                  width: 300,
                  decoration: new BoxDecoration(
                      color: changeGradeColor(nug[key]).color,
                      borderRadius: new BorderRadius.all(Radius.circular(15))
                  ),

                  //color: Colors.grey,myBgColors[1].color,
                  child: Padding(
                    padding:EdgeInsets.fromLTRB(20, 0, 0, 0),
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

                  color: changeGradeColor(nug[key]).color,
                  child: Text(
                    nug[key].toString(),
                  ),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
            ],
          ));
        },
    );
  }
}

class previousSemesterListView extends StatelessWidget{
  @override
  //Map nug = {"Cs1337":99.5,"Math2414":85.3,"AHST":77.0,"AHSmmT":60.0,"Nug":90.0};
  static Map nug = student1.getPreviousSemester();
  //int lengths = nug.length;

  //print(lengths);
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nug.length,
      itemBuilder: (BuildContext context, int index){
        String key = nug.keys.elementAt(index);
        return new Container(
            height: 50,
            //color: Colors.amber[600],
            child:Row(
              children: <Widget>[
                Card(

                  child: Container(

                    height: 49,
                    width: 300,
                    decoration: new BoxDecoration(
                        color: changeGpaColor(nug[key]).color,
                        borderRadius: new BorderRadius.only(
                            topLeft:  const  Radius.circular(15.0),
                            topRight: const  Radius.circular(15.0),
                            bottomRight: const  Radius.circular(15.0),
                            bottomLeft: const  Radius.circular(15.0))
                    ),

                    //color: Colors.grey,myBgColors[1].color,
                    child: Padding(
                      padding:EdgeInsets.fromLTRB(20, 0, 0, 0),
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
            ));
      },
    );
  }
}

class _MyColor {
  const _MyColor(this.color, this.name);

  final Color color;
  final String name;
}
