import 'package:flutter/material.dart';

class SurahListTile extends StatefulWidget {
  String name;
  String number;
  SurahListTile({this.name, this.number});
  @override
  _SurahListTileState createState() => _SurahListTileState();
}

class _SurahListTileState extends State<SurahListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      leading: Text(widget.number),
    );
  }
}
