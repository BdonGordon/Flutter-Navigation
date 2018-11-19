import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final GlobalKey<NavigatorState> coreNavigatorKey;
  Home({Key key, this.coreNavigatorKey}) : super(key: key);

  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text("Home"),
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Testing"),
        ));
      },
    );
  }
}