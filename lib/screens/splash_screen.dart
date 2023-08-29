import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/switch_account_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => SwitchAccountScreen(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashPattern.png'),
            opacity: 0.3,
            fit: BoxFit.fitWidth,
            repeat: ImageRepeat.repeatY,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Image(
                width: 156.0,
                image: AssetImage('assets/images/splashLogo.png'),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(
                      color: Color(0xffFFFFFF).withOpacity(0.4),
                    ),
                  ),
                  Text(
                    'Ali Mohammadzadeh',
                    style: TextStyle(color: Color(0xff55B9F7)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
