import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(gradedApp());

class gradedApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
  //MyApp createState() => MyApp();
}

void changeText() {}

class MyApp extends State<gradedApp> {
  double currentGpa = 4.0;
  double cummulGpa = 4.0;
  Map<String, double> map1 = {'Cs1337': 99.3 , 'Math 2414': 90.3, 'Nah U goog': 69.69};
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
                        appBarIcons(title: 'Car', icon: Icons.autorenew).icon),
                    onPressed: () {
                      print("ye i clicke it");
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                      height: 50,
                      color: Colors.amber[600],
                      //child:  Center(child: Text('Entry A')),
                      child: Row(
                        children: <Widget>[
                          Card(
                            child: Container(
                              height: 49,
                              width: 300,
                              color: Colors.grey,
                              child: Text(
                                "dfdfdf",
                                textAlign: TextAlign.center,
                              ),
                              alignment: Alignment(-1.0, 0.0),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 49,
                              width: 75,
                              color: Colors.grey,
                              child: Text(
                                "99.5",
                              ),
                              alignment: Alignment(0.0, 0.0),
                            ),
                          ),

                        ],
                      )),
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Previous Semester",
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Card(
                  child: Container(
                    width: 190,
                    color: Colors.grey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
                          child: Text(
                            "Cummulative GPA",
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
                    width: 190,
                    height: 100,
                    color: Colors.grey,
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
