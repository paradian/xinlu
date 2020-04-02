import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
    Drawer(
      child:ListView(
        padding: EdgeInsets.all(1),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('paradian'),
            accountEmail: Text('helloparadian@email.com'),
          ),
          ListTile(
            title: Text('formPage'),
            onTap: () => Navigator.pushNamed(context, "/form"),
          ),
          ListTile(
            title: Text('counterPage'),
            onTap: () => Navigator.pushNamed(context, "/counter"),
          ),
          ListTile(
            title: Text('noPage'),
            onTap: () =>Fluttertoast.showToast(msg: "there is no page here"),
          )

        ],
      ) ,
    );
  }
}