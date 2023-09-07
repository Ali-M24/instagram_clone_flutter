import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instgram_clone/constant/Colors.dart';
import 'package:instgram_clone/constant/Theme.dart';
import 'package:instgram_clone/screens/activity_screen.dart';
import 'package:instgram_clone/screens/add_screen.dart';
// import 'package:instgram_clone/screens/home_screen.dart';
// import 'package:instgram_clone/screens/search_screen.dart';
// import 'package:instgram_clone/screens/signin_screen.dart';
// import 'package:instgram_clone/screens/splash_screen.dart';

void main() {
  runApp(const InstagramCloneApp());
}

class InstagramCloneApp extends StatelessWidget {
  const InstagramCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    //change android status bar color when application run
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );
    //change android status bar color when application run

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(),
      home: ActivityScreen(),
    );
  }
}
