import 'package:flutter/material.dart';
import 'studentObject.dart';
import 'homePage.dart';

class addNewAssignment extends StatefulWidget {
  studentObject student1;
  String name;
  String distName;
  addNewAssignment({Key key, @required this.student1,@required this.name,@required this.distName}) : super(key: key);
  @override
  _addNewAssignment createState() => _addNewAssignment(student1,name,distName);
}

class _addNewAssignment extends State<addNewAssignment> {
  String className;
  studentObject student1;
  String assignmentName;
  String distName;
  //percent of total grade
  double POG;
  _addNewAssignment(this.student1,this.className,this.distName);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add Assignment"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Assignment Name",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Card(
                    color: Colors.grey,
                    child: TextField(
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text){
                        assignmentName = text;
                      },
                    ),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Assignment Grade",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Card(
                    color: Colors.grey,
                    child: TextField(
                      autofocus: false,
                      keyboardType: TextInputType.numberWithOptions(signed:false,decimal: true),
                      onChanged: (text){
                        POG = double.parse(text);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Container(
                  height: 50,
                  width: 300,
                  child: Card(
                    color: Colors.lightBlueAccent,
                    child: FlatButton(
                      padding: EdgeInsets.all(10.0),
                      child: Column( // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Text("Add Asignment")
                        ],
                      ),
                      onPressed: () {
                        if(assignmentName != null && POG != null){
                          //print(className);
                          student1.currentSemester[className].distribution[distName].addAssignments(assignmentName,POG.toString());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => gradedApp(student1:student1)));
                        }
                        else{
                          //Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("EMPTY TEXT FIELD")));
                          print("NuG");
                        }

                      },

                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
