import 'package:flutter/material.dart';
import 'package:instgram_clone/constant/Colors.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, left: 18, right: 18),
      child: Column(
        children: [
          Container(
            child: TabBar(
              indicatorWeight: 2,
              indicatorColor: secondaryColor,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Following',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Tab(
                  child: Text(
                    'You',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
