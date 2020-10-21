import 'package:flutter/material.dart';
import 'package:madproject/helpers/ColorSys.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        UserAccountsDrawerHeader(
            accountName: Text("Rutvik Patel"),
            accountEmail: Text("rutvikpatedsrp@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1497485692312-a26e1cc30f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
            )),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Rutvik Patel"),
          subtitle: Text("Devloper"),
          //trailing: Icon(Icons.edit),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text("Email"),
          subtitle: Text("rutvikpateldsrp@gmail.com"),
          // trailing: Icon(Icons.edit),
        )
      ],
    ));
  }
}
