import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:quran/parahdata/parahView.dart';
import 'package:quran/screens/homeScreen.dart';

class ParahIndexView extends StatefulWidget {
  @override
  _ParahIndexViewState createState() => _ParahIndexViewState();
}

class _ParahIndexViewState extends State<ParahIndexView> {
  final options = LiveOptions(
    delay: Duration(seconds: 2),
    showItemInterval: Duration(milliseconds: 2000),
    showItemDuration: Duration(seconds: 2),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFFB49A68),
            ),
            onPressed: () {
              return Navigator.pop(context);
            },
          ),
          title: Text(
            "Parah's",
            style: TextStyle(color: Color(0xFFB49A68)),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shadowColor: Color.fromRGBO(32, 33, 36, 1.0),
        ),
        body: LiveGrid.options(
          options: options,
          itemBuilder: (context, index, animation) {
            int a = index + 1;
            return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ParahView(
                      index: a,
                    );
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Color(0xFFB49A68))),
                    child: Card(
                      borderOnForeground: true,
                      elevation: 8.0,
                      clipBehavior: Clip.antiAlias,
                      semanticContainer: true,
                      shadowColor: Color(0xFFB49A68),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: Text(
                          a.toString(),
                          style:
                              TextStyle(fontSize: 40, color: Color(0xCAB49968)),
                        ),
                      ),
                    ),
                  ),
                ));
          },
          itemCount: 30,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 9,
          ),
        ));
  }
}
