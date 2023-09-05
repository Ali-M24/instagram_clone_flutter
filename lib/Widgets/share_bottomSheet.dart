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
          height: 400,
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
          child: _getShareSheetContent(),
        ),
      ),
    );
  }

  CustomScrollView _getShareSheetContent() {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image:
                    AssetImage('assets/icons/icon_bottomsheet_indicator.png'),
              ),
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Share',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'GB', fontSize: 24),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image(
                      image:
                          AssetImage('assets/icons/icon_bottomsheet_share.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            },
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        )
      ],
    );
  }
}
