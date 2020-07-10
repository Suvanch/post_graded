import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:postgraded/Intro.dart';

class settingsPage extends StatelessWidget{
  bool _tester = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: Text('Settings',textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.all(8.0),
              color: Colors.blue[900],
              child: ListTile(
                onTap: (){
                  //Edit name or details
                },
                title: Text("Rajmeet Juneja",style: TextStyle(color: Colors.white,fontWeight:
                FontWeight.w500),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                trailing: Icon(Icons.edit, color: Colors.white,),
              ),
            ),
            //const SizedBox(width: 10.0,),
            Center(
              child: Text("GPA Scale",textAlign: TextAlign.center, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade200,
              ),),
            ),
            Center(
              child: Text("GPA Scale",textAlign: TextAlign.center, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),),
            ),
            Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: new Text("4.0", style: TextStyle(color: Colors.white),),
                      color: Colors.lightBlue,
                      onPressed: null,
                    ),
                    VerticalDivider(),
                    FlatButton(
                      child: new Text("5.0", style: TextStyle(color: Colors.white),),
                      color: Colors.lightBlue[400],
                      onPressed: null,
                    ),
                    VerticalDivider(),
                    FlatButton(
                      child: new Text("6.0", style: TextStyle(color: Colors.white),),
                      color: Colors.lightBlue[200],
                      onPressed: null,
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 20.0,),
            Center(
              child: Text("Notification Settings",textAlign: TextAlign.center, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),),
            ),
            SwitchListTile(
              dense: true,
              activeColor: Colors.blue[900],
              contentPadding: const EdgeInsets.all(0),
              value: true,
                title: Text("New Grades Notification", style: TextStyle(fontSize: 15.0),),
                onChanged: (val){},
            ),
            SwitchListTile(
              dense: true,
              activeColor: Colors.blue[900],
              contentPadding: const EdgeInsets.all(0),
              value: false,
              title: Text("Assignment Added Notification", style: TextStyle(fontSize: 15.0),),
              onChanged: (val){},
            ),
            SwitchListTile(
              dense: true,
              activeColor: Colors.blue[900],
              contentPadding: const EdgeInsets.all(0),
              value: true,
              title: Text("Announcements Notification", style: TextStyle(fontSize: 15.0),),
              onChanged: (val){},
            ),
            const SizedBox(height: 20.0,),
            Center(
              child: Text("Other Settings",textAlign: TextAlign.center, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),),
            ),
            CheckboxListTile(
              dense: true,
              activeColor: Colors.blue[900],
              subtitle: Text("From sunrise to sunset"),
              value: false,
              title: Text("Night Mode Auto", style: TextStyle(fontSize: 15.0),),
              onChanged: (val){},
            ),
            Center(
              child: Text("GPA Scale",textAlign: TextAlign.center, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade200,
              ),),
            ),
            Center(
              child: FlatButton(
                child: new Text("LOGOUT", style: TextStyle(fontSize: 20.0,color: Colors.green),),
                color: Colors.grey.shade200,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ],
        ),
      ),
      );
  }
}