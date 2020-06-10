import 'package:flutter/material.dart';
import 'studentObject.dart';
import 'main.dart';


//needs to check if name doesent alredy exist
//add snack bar when feilds are left blank

class addNewDistribution extends StatefulWidget {
  studentObject student1;
  String name;
  addNewDistribution({Key key, @required this.student1,@required this.name}) : super(key: key);
  @override
  _addNewDistribution createState() => _addNewDistribution(student1,name);
}

class _addNewDistribution extends State<addNewDistribution> {
  String className;
  studentObject student1;
  String name;
  //percent of total grade
  double POG;
  _addNewDistribution(this.student1,this.className);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add Distribution"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Distribution Name",
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
                  "Percent of Total Grade",
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
                    child:


                    FlatButton(
                      padding: EdgeInsets.all(10.0),
                      child: Column( // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Text("Add Distribution")
                        ],
                      ),
                      onPressed: () {
                        if(name != null && POG != null){
                          student1.currentSemester[className].addDistribution(name,POG);
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
