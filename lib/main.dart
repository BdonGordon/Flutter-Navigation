import 'package:flutter/material.dart';
import 'package:flutter_navigation/AuthenticationScreen.dart';
import 'package:flutter_navigation/Core.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthenticationScreen(),
        '/Core': (context) => Core()
      },
    );
  }
}