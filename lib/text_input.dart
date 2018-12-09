import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {

  final TextEditingController _textEditingController;

  TextInput(this._textEditingController);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextInputState();
  }

}

class TextInputState extends State<TextInput>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,0,10.0,0),
      child: TextField(
        controller: widget._textEditingController,
      ),
    );
  }

}