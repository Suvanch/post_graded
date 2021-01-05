import 'package:flutter/material.dart';
import 'studentObject.dart';
import 'homePage.dart';

class addNewClass extends StatefulWidget{
  studentObject student1;
  addNewClass({Key key, @required this.student1}) : super(key: key);
  @override
  _addNewClass createState() => _addNewClass(student1);
}

class _addNewClass extends State<addNewClass> {
  studentObject student1;
  String name;
  String teacher;
  String location;
  int credits;
  double grade;
  _addNewClass(this.student1);
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
                  "Cource Name",
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
                  "Proffessor",
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
                        credits = int.parse(text);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Location",
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
                        location = text;
                      },
                    ),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Current Grade in Class",
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
                        grade = double.parse(text);
                      },
                    ),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Credits",
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
                          Text("Add Class")
                        ],
                      ),
                      onPressed: () {
                        print(name );
                        print(grade);
                        print(credits);
                        if(name != null&& grade != null && credits != null){
                          student1.addClass(name, "df", "df", grade, credits);
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