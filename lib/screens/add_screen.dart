import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_clone/bloc/bnIdex_bloc.dart';
import 'package:instgram_clone/bloc/bnIdex_event.dart';
import 'package:instgram_clone/bloc/bnIdex_state.dart';
import 'package:instgram_clone/constant/Colors.dart';
import 'package:instgram_clone/screens/home_screen.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BNIndexBloc, bnIndexState>(
      builder: (context, state) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              context.read<BNIndexBloc>().add(UpdateBNIndex(0));
            }
          },
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 64,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          sliver: SliverToBoxAdapter(
                            child: Container(
                              width: double.infinity,
                              height: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                    'assets/images/explores/item2.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(
                              left: 18, right: 18, top: 10, bottom: 172),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              childCount: 12,
                              (context, index) {
                                var indexImage = index + 1;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: (indexImage < 10)
                                          ? Image.asset(
                                              'assets/images/explores/item$indexImage.png',
                                            )
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, left: 18, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Post',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              width: 16,
                              'assets/icons/icon_arrow_down_ios.png',
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              width: 20,
                              'assets/icons/icon_add_next.png',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: lightPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Draft',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'Gallery',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'Take',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
