import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:quran/Api/ApiCalling.dart';
import 'package:quran/widgets/shimmer.dart';

class SajdaViewList extends StatefulWidget {
  @override
  _SajdaViewListState createState() => _SajdaViewListState();
}

class _SajdaViewListState extends State<SajdaViewList> {
  final options = LiveOptions(
    delay: Duration(seconds: 1),
    showItemInterval: Duration(milliseconds: 0),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: ApiCalling().getSajda(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: ShimmerLoading(
                    title: "Parah",
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasData) {
                return Center(
                    child:
                        Text("Connectivity Error! Please Try Again Later :)"));
              } else if (snapshot.hasData == null) {
                return Center(
                    child: Text(
                        "Connectivity Error! Please Check your Internet Connection"));
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  "Something went wrong on our side!\nWe are trying to reconnect :)",
                  textAlign: TextAlign.center,
                ));
              } else {
                return GestureDetector(
                  onHorizontalDragUpdate: (a) {
                    return Navigator.pop(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(
                          'image/frame.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 40),
                        child: LiveList.options(
                          options: options,
                          itemCount: snapshot.data.sajda.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, int index,
                              Animation<double> animation) {
                            final surah = snapshot.data.sajda;
                            return FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0,
                                  end: 1,
                                ).animate(animation),
                                // And slide transition
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset(0, -0.1),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  // Paste you Widget
                                  child: SajdaData(
                                      surah[index].text,
                                      surah[index].numberInSurah,
                                      surah[index].revelationType,
                                      surah[index].name),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}

class SajdaData extends StatelessWidget {
  String text;
  int number;
  String name;
  String revelationType;
  SajdaData(this.text, this.number, this.revelationType, this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 20.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    "$text" ?? "",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Color(0xFFB49A68), fontSize: 24),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Surah Name : " + name.toString(),
                    style: TextStyle(color: Color(0xFFB49A68), fontSize: 20),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ayah Number: " + number.toString(),
                    style: TextStyle(color: Color(0xFFB49A68), fontSize: 20),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Revelation Type : " + revelationType.toString(),
                    style: TextStyle(color: Color(0xFFB49A68), fontSize: 20),
                  ),
                ),
                Divider(),
              ],
            )),
      ),
    );
  }
}
