import 'package:flutter/material.dart';
import 'package:flutter_navigation/Home.dart';
import 'package:flutter_navigation/Profile.dart';
import 'package:flutter_navigation/Settings.dart';

class Core extends StatefulWidget {
  CoreState createState() {
    return new CoreState();
  }
}

class CoreState extends State<Core> {
  int _tab = 0;
  GlobalKey<NavigatorState> _coreNavigatorKey = new GlobalKey<NavigatorState>();
  GlobalKey<DrawerControllerState> _drawerKey = new GlobalKey<DrawerControllerState>();

  @override
  didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Updated?");
  }

  _handleDrawerItemChange(String selectedItem) {
    if(selectedItem.compareTo("settings") == 0) {
      this._coreNavigatorKey.currentState.pushNamed("Core/coreNavigation/drawerNavigation/settings");
      Navigator.of(context).pop();
    }
  }

  _handleTabChange(BuildContext context, int index) {
    setState(() {
      this._tab = index;
    });

    if(index == 0) {
      this._coreNavigatorKey.currentState.pushReplacementNamed("bottomNavigation/home");
    }
    else if(index == 1) {
      this._coreNavigatorKey.currentState.pushReplacementNamed("bottomNavigation/profile");
    }
    else if(index == 2) {
      Scaffold.of(context).openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Core"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),

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
        child: _buildCoreNavigator(),
      ),
    );
  }

  Navigator _buildCoreNavigator() {
    return Navigator(
      key: _coreNavigatorKey,
      initialRoute: "bottomNavigation/home",
      onGenerateRoute: (RouteSettings settings){
        WidgetBuilder builder;

        print("CORE_NAV: ${settings.name}");

        switch(settings.name) {
          case "bottomNavigation/home": {
            builder = (context) => Home();
            break;
          }

          case "bottomNavigation/profile": {
            builder = (context) => Profile();
            break;
          }

          case "Core/coreNavigation/drawerNavigation/settings": {
            builder = (context) => Settings();
            break;
          }

          default: {
            throw Exception("Error in route: ${settings.name}");
          }
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

///       drawer: Drawer(
//        key: this._drawerKey,
//        child: ListView(
//          children: <Widget>[
//            MaterialButton(
//              onPressed: (){_handleDrawerItemChange("settings");},
//              child: Text("SETTINGS"),
//            ),
//            MaterialButton(
//              onPressed: (){_handleDrawerItemChange("logout");},
//              child: Text("LOGOUT"),
//            ),
//          ],
//        ),
//      ),