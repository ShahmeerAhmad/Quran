import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  String text;
  Function function;

  HomeButton({@required this.text, @required this.function});
  @override
  _HomeButtonState createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: StadiumBorder(),
      height: 100,
      minWidth: 200,
      elevation: 100,
      color: Color(0xB0106270),
      onPressed: widget.function,
      child: Text(
        widget.text,
        style: TextStyle(color: Color(0xFFB49A68), fontSize: 25),
      ),
    );
  }
}
