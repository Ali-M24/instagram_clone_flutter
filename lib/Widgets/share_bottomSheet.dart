import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instgram_clone/constant/Colors.dart';

class Share_BottomSheet extends StatelessWidget {
  const Share_BottomSheet({required this.controller, super.key});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20.0,
          sigmaY: 20.0,
        ),
        child: Container(
          padding: EdgeInsets.only(left: 42, right: 42),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                whiteColor.withOpacity(0.2),
                whiteColor.withOpacity(0.2),
              ],
            ),
          ),
          child: _getShareSheetContent(context),
        ),
      ),
    );
  }

  Widget _getShareSheetContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image(
                    image: AssetImage(
                        'assets/icons/icon_bottomsheet_indicator.png'),
                  ),
                  SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GB',
                            fontSize: 24),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image(
                          image: AssetImage(
                              'assets/icons/icon_bottomsheet_share.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/icons/icon_serach_shareBox.png',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'search...',
                                hintStyle: TextStyle(color: whiteColor),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 50,
                (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.asset(
                          'assets/images/stories/story3.jpg',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Alimmz',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: 'GB',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 110),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 84))
          ],
        ),
        Positioned(
          bottom: 48,
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Text('Send'),
            ),
          ),
        ),
      ],
    );
  }
}
