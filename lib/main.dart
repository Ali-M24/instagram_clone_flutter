import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_clone/bloc/bnIdex_bloc.dart';
import 'package:instgram_clone/bloc/bnIdex_event.dart';
import 'package:instgram_clone/bloc/bnIdex_state.dart';
import 'package:instgram_clone/constant/Colors.dart';
import 'package:instgram_clone/constant/Theme.dart';
import 'package:instgram_clone/screens/activity_screen.dart';
import 'package:instgram_clone/screens/add_screen.dart';
import 'package:instgram_clone/screens/home_screen.dart';
import 'package:instgram_clone/screens/search_screen.dart';
// import 'package:instgram_clone/screens/activity_screen.dart';

void main() {
  runApp(const InstagramCloneApp());
}

class InstagramCloneApp extends StatefulWidget {
  const InstagramCloneApp({super.key});

  @override
  State<InstagramCloneApp> createState() => _InstagramCloneAppState();
}

class _InstagramCloneAppState extends State<InstagramCloneApp> {
  @override
  Widget build(BuildContext context) {
    //change android status bar color when application run
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );
    //change android status bar color when application run
    int currentIndex = 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(),
      home: BlocProvider(
        create: (context) => BNIndexBloc(),
        child: Scaffold(
            backgroundColor: primaryColor,
            appBar: currentIndex == 0 ? getAppBar() : null,
            body: BlocBuilder<BNIndexBloc, bnIndexState>(
              builder: (context, state) {
                if (state is bnIndexInitial) {
                  return HomeScreen();
                } else if (state is bnIndex) {
                  switch (state.index) {
                    case 0:
                      return HomeScreen();
                    case 1:
                      return SearchScreen();
                    case 2:
                      return AddScreen();
                    case 3:
                      return ActivityScreen();
                  }
                }
                throw 'Fuck!';
              },
            ),
            // currentIndex == 0
            //     ? HomeScreen()
            //     : currentIndex == 1
            //         ? SearchScreen()
            //         : currentIndex == 2
            //             ? AddScreen()
            //             : ActivityScreen(),
            bottomNavigationBar: BlocBuilder<BNIndexBloc, bnIndexState>(
              builder: (context, state) {
                print('currentIndex : ${currentIndex}');
                if (state is bnIndexInitial) {
                  currentIndex = state.currentIndex;
                } else if (state is bnIndex) {
                  currentIndex = state.index;
                }
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: currentIndex == 2
                      ? null
                      : BottomNavigationBar(
                          onTap: (int newIndex) {
                            context
                                .read<BNIndexBloc>()
                                .add(UpdateBNIndex(newIndex));
                          },
                          currentIndex: currentIndex,
                          type: BottomNavigationBarType.fixed, // Fixed
                          backgroundColor:
                              lightPrimaryColor, // <-- This works for fixed
                          selectedItemColor: secondaryColor,
                          unselectedItemColor: greyColor,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          items: [
                            BottomNavigationBarItem(
                              icon: Image(
                                  image:
                                      AssetImage('assets/icons/icon_home.png')),
                              activeIcon: Image(
                                  image: AssetImage(
                                      'assets/icons/icon_active_home.png')),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: Image(
                                  image: AssetImage(
                                      'assets/icons/icon_search_navigation.png')),
                              activeIcon: Image(
                                  image: AssetImage(
                                      'assets/icons/icon_search_navigation_active.png')),
                              label: 'Serach',
                            ),
                            BottomNavigationBarItem(
                              icon: Image(
                                  image: AssetImage(
                                      'assets/icons/icon_add_navigation.png')),
                              activeIcon: Image(
                                  image: AssetImage(
                                      'assets/icons/icon_add_navigation_active.png')),
                              label: 'Add',
                            ),
                            BottomNavigationBarItem(
                              icon: Image(
                                  image: AssetImage(
                                      'assets/icons/icon_activity_navigation.png')),
                              activeIcon: Image(
                                  image: AssetImage(
                                      'assets/icons/icon_activity_navigation_active.png')),
                              label: 'Activity',
                            ),
                          ],
                        ),
                );
              },
            )),
      ),
    );
  }

  AppBar getAppBar() {
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
