import 'package:flutter/material.dart';
import 'package:quran/parahdata/parahIndexview.dart';
import 'package:quran/screens/drawerScreen.dart';
import 'package:quran/surahData/surahlistview.dart';
import 'package:quran/widgets/homebutton.dart';

import 'package:flutter_share/flutter_share.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController _controller;

  AppBar appBar = AppBar();
  double borderRadius = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return WillPopScope(
      onWillPop: () async {
        if (!isCollapsed) {
          setState(() {
            _controller.reverse();
            borderRadius = 0.0;
            isCollapsed = !isCollapsed;
          });
          return false;
        } else
          return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: <Widget>[
            menu(context),
            AnimatedPositioned(
                left: isCollapsed ? 0 : 0.6 * screenWidth,
                right: isCollapsed ? 0 : -0.2 * screenWidth,
                top: isCollapsed ? 0 : screenHeight * 0.1,
                bottom: isCollapsed ? 0 : screenHeight * 0.1,
                duration: duration,
                curve: Curves.fastOutSlowIn,
                child: dashboard(context)),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: FractionallySizedBox(
            widthFactor: 0.6,
            heightFactor: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[DrawerList()],
            ),
          ),
        ),
      ),
    );
    // ),
    // )
  }

  Widget dashboard(context) {
    return SafeArea(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        type: MaterialType.card,
        animationDuration: duration,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              bottomOpacity: 0,
              elevation: 8.8,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _controller,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isCollapsed) {
                        _controller.forward();

                        borderRadius = 16.0;
                      } else {
                        _controller.reverse();

                        borderRadius = 0.0;
                      }

                      isCollapsed = !isCollapsed;
                    });
                  }),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    "image/back.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                !isCollapsed
                    ? Container()
                    : Positioned(
                        top: 250,
                        right: 50,
                        bottom: 10,
                        left: 50,
                        child: ListView(
                          children: [
                            HomeButton(
                                text: "Parah Index", function: parabutton),
                            SizedBox(
                              height: 10,
                            ),
                            HomeButton(
                                text: "Surah Index", function: surahbutton),
                            SizedBox(
                              height: 10,
                            ),
                            HomeButton(text: "Share", function: share),
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  parabutton() {
    Navigator.pop(context);
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ParahIndexView();
    }));
  }

  surahbutton() {
    Navigator.pop(context);
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SurahListView();
    }));
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'App Share',
        text: 'App still in process ',
        linkUrl: 'https://github.com/ShahmeerAhmad/Quran',
        chooserTitle: 'Provide a star to repository');
  }
}
