import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instgram_clone/Widgets/share_bottomSheet.dart';
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
      body: _getHomePageBody(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  ClipRRect _getBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: lightPrimaryColor, // <-- This works for fixed
        selectedItemColor: secondaryColor,
        unselectedItemColor: greyColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/icons/icon_home.png')),
            activeIcon:
                Image(image: AssetImage('assets/icons/icon_active_home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage('assets/icons/icon_search_navigation.png')),
            activeIcon: Image(
                image: AssetImage(
                    'assets/icons/icon_search_navigation_active.png')),
            label: 'Serach',
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage('assets/icons/icon_add_navigation.png')),
            activeIcon: Image(
                image:
                    AssetImage('assets/icons/icon_add_navigation_active.png')),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage('assets/icons/icon_activity_navigation.png')),
            activeIcon: Image(
                image: AssetImage(
                    'assets/icons/icon_activity_navigation_active.png')),
            label: 'Activity',
          ),
        ],
      ),
    );
  }

  Padding _getHomePageBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _getStorySection(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return _getPost();
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _getStorySection() {
    return Container(
      height: 90,
      margin: EdgeInsets.only(bottom: 24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => index == 0
            ? _getAddStoryContainer()
            : _getStoryContainer('assets/images/stories/story1.jpg'),
      ),
    );
  }

  // ListView _getPostList() {
  //   return ListView.builder(
  //     physics: NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     itemCount: 9,
  //     itemBuilder: (context, index) => _getPost(),
  //   );
  // }

  Column _getPost() {
    return Column(
      children: [
        _getPostUserInfo(),
        SizedBox(height: 22),
        _getPostContent('assets/images/stories/story1.jpg', 2.5, 500),
      ],
    );
  }

  SizedBox _getPostContent(
      String postImagePath, double likeCount, int commentCount) {
    return SizedBox(
      width: 394,
      height: 425,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: AssetImage(postImagePath),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image(
              image: AssetImage('assets/icons/icon_post_video.png'),
            ),
          ),
          Positioned(
            bottom: 15,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        whiteColor.withOpacity(0.5),
                        whiteColor.withOpacity(0.2)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/icons/icon_like.png'),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${likeCount}k',
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'GB',
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/icons/icon_comment.png'),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${commentCount}',
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'GB',
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(),
                              barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return DraggableScrollableSheet(
                                  initialChildSize: 0.4,
                                  minChildSize: 0.3,
                                  maxChildSize: 0.7,
                                  builder: (context, scrollController) {
                                    return Share_BottomSheet(
                                      controller: scrollController,
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Image(
                            image: AssetImage('assets/icons/icon_send.png'),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/icons/icon_save.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _getPostUserInfo() {
    return Row(
      children: [
        _getPostShowProfile(
          'assets/images/stories/story2.jpg',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alimmz__',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: 'GB',
                  fontSize: 14,
                ),
              ),
              Text(
                'برنامه نویس فلاتر',
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: 'SM',
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Image(
          image: AssetImage('assets/icons/icon_three_dots.png'),
        ),
      ],
    );
  }

  Column _getStoryContainer(String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image(image: AssetImage(imagePath)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          'test',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Container _getPostShowProfile(String imagePath, {double size = 48.0}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(image: AssetImage(imagePath)),
            ),
          ),
        ),
      ),
    );
  }

  Column _getAddStoryContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image(
                image: AssetImage('assets/icons/icon_add_story.png'),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          'test',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )
      ],
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
