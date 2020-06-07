import 'package:flutter/material.dart';
import 'studentObject.dart';
import 'main.dart';
import 'one_class.dart';


//needs to check if name doesent alredy exist
//add snack bar when feilds are left blank

class editDistribution extends StatefulWidget {
  studentObject student1;
  String className,oldDistributionName;
  editDistribution({Key key, @required this.student1,@required this.className,@required this.oldDistributionName}) : super(key: key);
  @override
  _editDistribution createState() => _editDistribution(student1,className,oldDistributionName);
}

class _editDistribution extends State<editDistribution> {
  String className;
  studentObject student1;
  String oldDistributionName;
  double oldPercentage;
  String newDistriutionName;

  _editDistribution(this.student1,this.className,this.oldDistributionName);
  @override
  Widget build(BuildContext context) {
    //percent of total grade
    double POG = student1.currentSemester[className].distribution[oldDistributionName].weight;
    return new Scaffold(
      appBar: AppBar(
        title: Text("Edit Distribution"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child:
                Text(
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
                      keyboardType:
                      TextInputType.text,
                      decoration: InputDecoration(
                        hintText: oldDistributionName,
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        newDistriutionName = text;
                      },
                      //widget.callback1(student1.getCumulativeGpa().toString());
                      // gpa = double.parse(text);
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Edit Percent of Total Grade",
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
                      keyboardType:
                      TextInputType.numberWithOptions(
                          signed: false, decimal: true),
                      decoration: InputDecoration(
                        hintText: student1.currentSemester[className].distribution[oldDistributionName].weight.toString(),
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        POG = double.parse(text);
                      },
                      //widget.callback1(student1.getCumulativeGpa().toString());
                      // gpa = double.parse(text);
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
                        if(newDistriutionName != null && POG != null){
                          student1.currentSemester[className].addDistribution(newDistriutionName,POG);
                            for (var k in student1.currentSemester[className].distribution[oldDistributionName].distributedGrades.keys) {
                              student1.currentSemester[className].distribution[newDistriutionName].addAssignments(k, student1.currentSemester[className].distribution[oldDistributionName].distributedGrades[k]);
                            }
                          student1.currentSemester[className].distribution.remove(oldDistributionName);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => gradedApp(student1:student1)));
                        }
                        else if(newDistriutionName ==null){
                          student1.currentSemester[className].distribution[oldDistributionName].weight = POG;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => gradedApp(student1:student1)));
                        }
                        else{
                            student1.currentSemester[className].addDistribution(newDistriutionName,POG);
                            for (var k in student1.currentSemester[className].distribution[oldDistributionName].distributedGrades.keys) {
                            student1.currentSemester[className].distribution[newDistriutionName].addAssignments(k, student1.currentSemester[className].distribution[oldDistributionName].distributedGrades[k]);
                            }
                            student1.currentSemester[className].distribution.remove(oldDistributionName);
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => gradedApp(student1:student1)));
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
