import 'package:flutter/material.dart';
import 'package:instgram_clone/constant/Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: _getAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      title: Image(
        width: 144,
        height: 32,
        image: AssetImage('assets/images/home_appbar_logo.png'),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage('assets/icons/icon_direct.png'),
            ),
          ),
        )
      ],
    );
  }
}
