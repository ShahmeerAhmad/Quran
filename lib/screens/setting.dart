import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/provider/ThemeData.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final _value = Provider.of<ThemeProvider>(context, listen: false);
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Dark Mode",
                        style: TextStyle(
                          fontSize: 22,
                        ))),
                Switch(
                    value: _value.getValue,
                    onChanged: (value) {
                      setState(() {
                        _value.setValue(value);
                        _value.swapTheme();
                      });
                    })
              ],
            ),
          ],
        ));
  }
}
