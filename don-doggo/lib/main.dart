import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Doggo"),
          backgroundColor: Colors.purple[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/dog.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                "Don Doggo",
                style: TextStyle(fontFamily: 'Oswald', fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(
                "Multi Stack Developer",
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
              ),
              Card(
                color: Colors.purple[100],
                margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone, color: Colors.purple[900]),
                      SizedBox(width: 20),
                      Text(
                        "9800000000",
                        style: TextStyle(fontFamily: 'Roboto'),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.purple[100],
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.mail, color: Colors.purple[900]),
                      SizedBox(width: 20),
                      Text(
                        "doggo@protonmail.com",
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
