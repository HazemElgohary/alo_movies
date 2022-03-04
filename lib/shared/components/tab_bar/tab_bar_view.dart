

import 'package:alo_movies/layout/tabs/classes_tab/page.dart';
import 'package:alo_movies/layout/tabs/over_view_tab/page.dart';
import 'package:flutter/material.dart';

import '../../../layout/tabs/community_tab/page.dart';

class TabViewItem extends StatefulWidget {
  const TabViewItem({Key? key}) : super(key: key);

  @override
  State<TabViewItem> createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelPadding: const EdgeInsets.symmetric(vertical: 10),
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            Text('overview'.toUpperCase(), style: const TextStyle(fontSize: 14)),
            Text('classes'.toUpperCase(), style: const TextStyle(fontSize: 14)),
            Text('community'.toUpperCase(), style: const TextStyle(fontSize: 14)),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              OverViewTab(),
              ClassesTab(),
              CommunityTab(),
            ],
          ),
        ),
      ],
    );
  }
}