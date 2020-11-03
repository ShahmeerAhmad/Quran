import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/provider/ThemeData.dart';
import 'package:quran/screens/homeScreen.dart';
import 'package:quran/screens/overboard.dart';
import 'package:quran/screens/setting.dart';
import 'package:quran/screens/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

// await prefs.setInt("Screen", 1);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _love = await SharedPreferences.getInstance();

  SharedPreferences.getInstance().then((prefs) {
    initScreen = prefs.getInt("initScreen") ?? 0;
    prefs.setInt("initScreen", 1);
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(ChangeNotifierProvider(
      child: MyApp(),
      create: (BuildContext context) {
        return ThemeProvider(isDarkTheme);
      },
    ));
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
            home: Builder(builder: (context) {
              return MainScreen();
            }),
            debugShowCheckedModeBanner: false,
            theme: value.getTheme(),
            initialRoute: initScreen == 0 || initScreen == null
                ? '/introduction'
                : '/splashscreen',
            routes: {
              '/introduction': (context) => OverBoards(),
              '/homeScreen': (context) => MainScreen(),
              '/splashscreen': (context) => Splashing(),
            });
      },
    );
  }
}
