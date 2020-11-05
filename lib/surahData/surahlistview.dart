import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:quran/Api/ApiCalling.dart';
import 'package:quran/screens/homeScreen.dart';
import 'package:quran/surahData/surahayatview.dart';
import 'package:quran/widgets/shimmer.dart';

class SurahListView extends StatefulWidget {
  @override
  _SurahListViewState createState() => _SurahListViewState();
}

class _SurahListViewState extends State<SurahListView> {
  Color _color = Color(0xFFB49A68);
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
          centerTitle: true,
          title: Text(
            "Surah Index",
            style: TextStyle(color: Color(0xFFB49A68)),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          shadowColor: Color(0xFF005459),
        ),
        extendBodyBehindAppBar: true,
        body: FutureBuilder(
          future: ApiCalling().getSurahs(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: ShimmerLoading(
                  title: "Surahs",
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
              return Center(
                  child: Text("Connectivity Error! Please Try Again Later :)"));
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
              return LiveList.options(
                options: options,
                itemCount: snapshot.data.surahs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index, Animation<double> animation) {
                  final surah = snapshot.data.surahs;
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onLongPress: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    print("Hello");
                                    return AlertDialog(
                                      title: Text(
                                        "Surah Info",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 26),
                                      ),
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      scrollable: true,
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Total Verses: " +
                                                      surah[index]
                                                          .ayahs
                                                          .length
                                                          .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  color: _color, fontSize: 20)),
                                          Divider(),
                                          Text(
                                            "Number of Surah: " +
                                                    surah[index]
                                                        .number
                                                        .toString() ??
                                                "",
                                            style: TextStyle(
                                                color: _color, fontSize: 20),
                                          ),
                                          Divider(),
                                          Text(
                                              "Revelation: " +
                                                      surah[index]
                                                          .revelationType ??
                                                  "",
                                              style: TextStyle(
                                                  color: _color, fontSize: 20)),
                                        ],
                                      ),
                                      actions: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: RaisedButton(
                                            color: Colors.cyanAccent[100],
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Ok"),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.brown[400],
                                    child: Text(
                                      surah[index].number.toString() ?? "",
                                      style: TextStyle(
                                          color: _color, fontSize: 20),
                                    ),
                                  ),
                                  title: Text(surah[index].name ?? "",
                                      style: TextStyle(
                                          color: _color, fontSize: 24)),
                                  trailing: Column(
                                    children: [
                                      Text(surah[index].revelationType ?? "",
                                          style: TextStyle(color: _color)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          surah[index]
                                                  .ayahs
                                                  .length
                                                  .toString() ??
                                              "",
                                          style: TextStyle(color: _color)),
                                    ],
                                  ),
                                  subtitle: Text(
                                      surah[index].englishNameTranslation ?? "",
                                      style: TextStyle(color: _color)),
                                  onTap: () {
                                    return Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AyatListView(
                                        ayats: surah[index].ayahs,
                                        revelationType:
                                            surah[index].revelationType,
                                        name: surah[index].name,
                                        englishname: surah[index].englishName,
                                      );
                                    }));
                                  },
                                ),
                                Divider(
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
