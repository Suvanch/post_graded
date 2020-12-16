import 'package:flutter/material.dart';
import 'package:postgraded/add_new_grade.dart';
import 'studentObject.dart';
import 'add_new_distribution.dart';
import 'edit_distribution.dart';
import 'main.dart';

class oneClass extends StatefulWidget {
  studentObject student1;
  String name;
  oneClass({Key key, @required this.student1, @required this.name})
      : super(key: key);
  @override
  _oneClass createState() => _oneClass(student1, name);
}

class _oneClass extends State<oneClass> {
  studentObject student1;
  String name;

  _oneClass(this.student1, this.name);

  @override
  Widget build(BuildContext context) {
    classObject class1 = student1.getClass(name);
    String classAverage = student1.getCurrentSemester()[name].grade.toString();

    //updates clase average
    void changeAverage() {
      setState(() {
        classAverage = student1.getCurrentSemester()[name].grade.toString();
      });
      //return classAverage;
    }

    //print(class1.distribution.length);
    return new Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(name,textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
        ),
        backgroundColor: Colors.grey.shade200,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(appBarIcons(
                        title: 'AddDistribution', icon: Icons.library_add)
                    .icon),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          addNewDistribution(student1: student1, name: name)));
                },
              ),
              IconButton(
                icon: Icon(
                    appBarIcons(title: 'Refresh', icon: Icons.refresh).icon),
                onPressed: () {
                  //refrest button
                  //make a new class and call to it
                  //use this to build it
                  //https://www.youtube.com/watch?v=5n8xP4ukzlM
                  //do the same thing for DeleteDistribution(ctrl f)
                  print("ye i clicke it");
                },
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: class1.distribution.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = class1.distribution.keys.elementAt(index);
                  distributionObject distribution1 = class1.getDistribution(key);
                  double weight = distribution1.getWeight();


                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(appBarIcons(
                                      title: 'DeleteDistribution',
                                      icon: Icons.delete)
                                  .icon),
                              onPressed: () {
                                student1.currentSemester[name]
                                    .deleteDistribution(key);
                              },
                            ),
                            IconButton(
                              icon: Icon(appBarIcons(
                                  title: 'EditDistribution',
                                  icon: Icons.edit)
                                  .icon),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        editDistribution(student1: student1,className: name,oldDistributionName:key)));
                              },
                            ),
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    key,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Total Weight: $weight",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(appBarIcons(
                                      title: 'AddGrade', icon: Icons.add)
                                  .icon),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => addNewAssignment(
                                        student1: student1,
                                        name: name,
                                        distName: key)));
                              },
                            ),
                          ],
                        ),
                        //individual grades
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: distribution1.distributedGrades.length,
                          itemBuilder: (BuildContext context, int index) {
                            String gradeName = distribution1.distributedGrades.keys.elementAt(index);

                            String dropdownValue = key;
                            var myList = [""];
                            class1.distribution.forEach((k, v) => myList.add(k));

                            return Dismissible(
                              key: new Key(gradeName),
                              onDismissed: (direction) {
                                class1.distribution[key].removeAssignment(gradeName);
                                //student1.getPreviousSemester().remove(key);
                                //print(student1.getPreviousSemester());
                                //Scaffold.of(context).showSnackBar(
                                //new SnackBar(content: new Text("Removed Semester")));
                                changeAverage();
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
                                  color: changeGradeColor(distribution1
                                          .distributedGrades[gradeName])
                                      .color,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      //grade name
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 50, 0),
                                        child: Text(
                                          gradeName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        //dropdown meun
                                        child:DropdownButton<String>(
                                          value: dropdownValue,
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.deepPurple),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              class1.moveGrade(key, newValue, gradeName);
                                            });
                                          },
                                          items: myList.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                        //dropDownMenu(oldDistributionName:key,assignmentName:gradeName,class1:class1),
                                      ),
                                      //grade average
                                      Card(
                                        child: Container(
                                          height: 49,
                                          width: 75,
                                          color: changeGradeColor(distribution1
                                                  .distributedGrades[gradeName])
                                              .color,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            autofocus: false,
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    signed: false, decimal: true),
                                            decoration: InputDecoration(
                                              hintText: distribution1
                                                  .distributedGrades[gradeName]
                                                  .toString(),
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
                                              distribution1.distributedGrades[
                                                  gradeName] = double.parse(text);
                                              changeAverage();
                                            },
                                            //widget.callback1(student1.getCumulativeGpa().toString());
                                            // gpa = double.parse(text);
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
                        )
                      ],
                    ),
                  );
                }),
          ),
          Row(
            children: <Widget>[
              Card(
                child: Container(
                  //rounding of the boxes
                  width: (MediaQuery.of(context).size.width / 2) - 10,
                  height: 100,
                  //the title text with padding to move the text arround for fun
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "GPA",
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      //the gpa text with padding to move the text arround for fun
                      Padding(
                        padding: EdgeInsets.fromLTRB(35.0, 0.0, 32.0, 16.0),
                        child: Text(
                          student1.getCurrentGPA().toString(),
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
                  width: (MediaQuery.of(context).size.width / 2) - 10,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Text(
                          " Class Average ",
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0.0, 32.0, 16.0),
                        child: Text(
                          classAverage.toString(),
                          textScaleFactor: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
