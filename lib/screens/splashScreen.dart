import 'package:flutter/material.dart';
import 'package:quran/screens/homeScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashing extends StatefulWidget {
  @override
  _SplashingState createState() => _SplashingState();
}

class _SplashingState extends State<Splashing> {
  @override
  Widget build(BuildContext context) {
    print("call");
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: MainScreen(),
      image: Image.asset("image/sp.png"),
      backgroundColor: Colors.white24,
      loaderColor: Colors.black54,
      photoSize: 50,
      loadingText: Text("Quran"),
      title: Text("Al'Quran"),
    );
  }
}
