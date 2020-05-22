import 'package:flutter/material.dart';
import 'studentObject.dart';
import 'main.dart';

class addNewSemester extends StatefulWidget {
  studentObject student1;
  addNewSemester({Key key, @required this.student1}) : super(key: key);
  @override
  _addNewSemester createState() => _addNewSemester(student1);
}

class _addNewSemester extends State<addNewSemester> {
  studentObject student1;
  String name;
  double gpa;
  int credits;
  _addNewSemester(this.student1);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add Semester"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Semester Name",
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
                          name = text;
                        },
                      ),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "GPA",
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
                          gpa = double.parse(text);
                        },
                      ),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Credits Earned",
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
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          credits = int.parse(text);
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
                    child:


                    FlatButton(
                      padding: EdgeInsets.all(10.0),
                      child: Column( // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Text("Add Semester")
                        ],
                      ),
                      onPressed: () {
                        if(name != null && gpa != null && credits != null){
                          student1.addSemester(name, gpa, credits);
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
class appBarIcons {
  const appBarIcons({this.title, this.icon});
  final String title;
  final IconData icon;
}