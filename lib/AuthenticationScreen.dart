import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  AuthenticationScreenState createState() {
    return new AuthenticationScreenState();
  }
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Login Screen"),
          ),
          RaisedButton(
            child: Text("LOGIN"),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/Core');
            },
          )
        ],
      ),
    );
  }
}