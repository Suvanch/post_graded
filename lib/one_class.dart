import 'package:flutter/material.dart';
import 'studentObject.dart';
import 'main.dart';

class oneClass extends StatefulWidget {
  studentObject student1;
  String name;
  oneClass({Key key, @required this.student1,@required this.name}) : super(key: key);
  @override
  _oneClass createState() => _oneClass(student1,name);
}

class _oneClass extends State<oneClass> {
   studentObject student1;
   String name;

  _oneClass(this.student1,this.name);

  @override
  Widget build(BuildContext context) {
    classObject class1 = student1.getClass(name);
    print(class1.distribution.length);
    return new Scaffold(
      appBar: AppBar(title: Center(child: Text(name),)),
      body: ListView.builder(
          itemCount: class1.distribution.length,
          itemBuilder: (BuildContext context, int index){
            String key = class1.distribution.keys.elementAt(index);
            distributionObject distribution1 = class1.getDistribution(key);
            print("fffff");
            print(class1.distribution.length);
            print(key);
            print(distribution1);
            double weight = distribution1.getWeight();
          return Container(
            child: Column(
              children: <Widget>[
                Center(child: Text(key),),
                Center(child: Text("Total Weight: remaining to $weight"),),
                /*
                ListView.builder(
                  itemCount: distribution1.distributedGrades.length,
                  itemBuilder: (BuildContext context, int index){
                    String gradeName = distribution1.distributedGrades.keys.elementAt(index);
                    return Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(gradeName),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            //child: Text(distribution1.distributedGrades[gradeName].percent.toString()),
                          )
                        ],
                      ),
                    );
                  },
                )
                 */
              ],
            ),
          );

          }
      ) ,
    );
/*
Column(
                children: <Widget>[
                  Center(child: Text(class1.distribution),)
                ],
              ),
*/
  }
}