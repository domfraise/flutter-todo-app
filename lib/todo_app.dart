import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(' List '),
        ),
        body: Center(
          child: ListManager(),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => authenticationService.callback()),
      ),
    );
  }
}
