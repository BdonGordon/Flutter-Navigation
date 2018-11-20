import 'package:flutter/material.dart';
import 'package:flutter_navigation/Home.dart';
import 'package:flutter_navigation/Profile.dart';
import 'package:flutter_navigation/Settings.dart';

import 'package:flutter_navigation/ShoppingCart.dart';
import 'package:flutter_navigation/ShoppingScreen.dart';

class Core extends StatefulWidget {
  CoreState createState() {
    return new CoreState();
  }
}

class CoreState extends State<Core> {
  int _tab = 0;
  GlobalKey<NavigatorState> _homeNavigatorKey = new GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _coreNavigatorKey = new GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldState> _coreScaffold = new GlobalKey();

  @override
  didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Updated?");
  }

  _handleTabChange(BuildContext context, int index) {
    setState(() {
      this._tab = index;
    });

    if(index == 0) {
      this._homeNavigatorKey.currentState.pushReplacementNamed("bottomNavigation/home");
    }
    else if(index == 1) {
      this._homeNavigatorKey.currentState.pushReplacementNamed("bottomNavigation/profile");
    }
    else if(index == 2) {
      this._coreScaffold.currentState.openDrawer();
    }
  }


  /// MAIN CLASS BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._coreScaffold,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._tab,
        onTap: (index) => _handleTabChange(context, index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text("More")
          )
        ]
      ),
      body: Center(
        child: _buildCoreNavigator()
      ),
    );
  }

  Navigator _buildCoreNavigator() {
    return Navigator(
      key: _coreNavigatorKey,
      initialRoute: "core/home",
      onGenerateRoute: (RouteSettings settings){
        WidgetBuilder builder;

        print("CORE_NAV: ${settings.name}");
        switch(settings.name) {
          case "core/home": {
            builder = (context) => _buildHomeNavigator();

            break;
          }

          case "core/cart": {
            builder = (context) => _buildShoppingScreen();

            break;
          }

          default:{
            throw Exception("Invalid CORE route: ${settings.name}");
          }
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  /// HOME CLASS
  Scaffold _buildHomeNavigator() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                this._coreNavigatorKey.currentState.pushNamed("core/cart");
              },
            )
          ],
        ),
        body: Navigator(
          key: _homeNavigatorKey,
          initialRoute: "bottomNavigation/home",
          onGenerateRoute: (RouteSettings settings){
            WidgetBuilder builder;

            print("HOME_NAV: ${settings.name}");

            switch(settings.name) {
              case "bottomNavigation/home": {
                builder = (context) => Home();
                break;
              }

              case "bottomNavigation/profile": {
                builder = (context) => Profile();
                break;
              }

              case "appBar/shoppingScreen": {
                builder = (context) => ShoppingScreen();
                break;
              }

              case "drawerNavigation/settings": {
                builder = (context) => Settings();
                break;
              }

              default: {
                throw Exception("Error in route: ${settings.name}");
              }
            }

            return MaterialPageRoute(builder: builder, settings: settings);
          },
        )
    );
  }

  Scaffold _buildShoppingScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHOPING"),
      ),
      body: Settings(),
    );
  }




}