import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './list_mananger.dart';
import './firebase/authentication_service.dart';

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TodoState();
  }
}

class TodoState extends State<TodoApp> {
  AuthenticationService authenticationService = AuthenticationService();
  FirebaseUser firebaseUser;
  var brightness = Brightness.light;
  var isDarkTheme = false;

  @override
  void initState() {
//    authenticationService.getDisplayName()
//        .then((name) {
//          setState(() {
//            displayName = name;
//            print(displayName);
//          });
//
//    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: brightness,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Switch(
              onChanged: (isDarkTheme) {
                setState(() {
                  if (isDarkTheme) {
                    brightness = Brightness.dark;
                  } else {
                    brightness = Brightness.light;
                  }
                  this.isDarkTheme = isDarkTheme;
                });
              },
              value: isDarkTheme,
              activeColor: Theme.of(context).primaryColorDark,
            )
          ],
          title: _buildAppbar(),
        ),
        body: Center(
          child: ListManager(brightness),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            authenticationService.handleSignIn().then((user) {
              setState(() {
                firebaseUser = user;
              });
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  _buildAppbar() {
    if (firebaseUser == null) {
      return Text("List");
    }
    return Text("${firebaseUser.displayName}'s List");
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Wifi"),
          content: Text("Wifi not detected. Please activate it."),
        )
    );
  }
}
