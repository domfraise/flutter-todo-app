import 'package:flutter/material.dart';

import './list_mananger.dart';
import './firebase/authentication_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AuthenticationService authenticationService = AuthenticationService();
  String displayName = "User";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(' List ' + authenticationService.getUser()),
        ),
        body: Center(
          child: ListManager(),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => authenticationService.callback()),
      ),
    );
  }
}
