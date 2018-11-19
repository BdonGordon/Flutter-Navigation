import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  final GlobalKey<NavigatorState> coreNavKey;

  Shopping({Key key, this.coreNavKey}): super(key: key);

  ShoppingState createState() {
    return new ShoppingState();
  }
}

class ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_cart),
      onPressed: (){
//        widget.coreNavKey.currentState.pushNamed("appBar/shoppingScreen");
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Text("Dialog"),
              )
            );
          }
        );
      },
    );
  }
}