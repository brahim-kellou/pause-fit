import 'package:flutter/material.dart';
import 'package:hms_start_hacking_flutter/app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMS Flutter starter app',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 255, 63, 25),
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,

        // Fonts
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.0,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.15,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.1,
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromARGB(255, 255, 63, 25),
        primaryColorLight: Colors.black,
        primaryColorDark: Colors.white,

        // Fonts
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.0,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.1,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const App(),
    );
  }
}
