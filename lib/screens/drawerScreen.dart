import 'package:flutter/material.dart';
import 'package:quran/sajdaData/SajdaView.dart';
import 'package:quran/screens/help.dart';
import 'package:quran/screens/setting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final _color = Color(0xB0106270);
  final _textcolor = Color(0xFFB49A68);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 5, top: 5),
      child: Container(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'image/2.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  return Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SajdaViewList();
                  }));
                },
                child: Card(
                  color: _color,
                  elevation: 8.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.read_more,
                      color: _textcolor,
                      size: 26,
                    ),
                    title: Text(
                      "Sajda Index",
                      style: TextStyle(
                          color: _textcolor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  return Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Help();
                  }));
                },
                child: Card(
                  color: _color,
                  elevation: 8.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.help,
                      color: _textcolor,
                      size: 24,
                    ),
                    title: Text(
                      "Help Guide",
                      style: TextStyle(
                          color: _textcolor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  return Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Setting();
                  }));
                },
                child: Card(
                  color: _color,
                  elevation: 8.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: _textcolor,
                      size: 23,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                          color: _textcolor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Card(
                color: _color,
                elevation: 8.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://github.com/ShahmeerAhmad/Quran';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 55,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('image/github.png')),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text("GitHub",
                                  style: TextStyle(
                                      color: _textcolor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
