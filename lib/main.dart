import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/home_screen.dart';
import 'package:instgram_clone/screens/signin_screen.dart';
import 'package:instgram_clone/screens/splash_screen.dart';

void main() {
  runApp(const InstagramCloneApp());
}

class InstagramCloneApp extends StatelessWidget {
  const InstagramCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            headlineMedium: TextStyle(
              fontFamily: 'GB',
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            headlineLarge:
                TextStyle(fontFamily: 'GB', fontSize: 20, color: Colors.white)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            elevation: 0,
            minimumSize: Size(129, 46),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
