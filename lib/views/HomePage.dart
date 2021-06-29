import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:circle/models/DataProvider.dart';
import 'package:circle/models/PostModel.dart';

import 'package:circle/widgets/HomePageAppBar.dart';
import 'package:circle/widgets/HomePageBottomNavBar.dart';
import 'package:circle/widgets/HomePageDrawer.dart';

class HomePage extends StatefulWidget {
  static String id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Posts newsFeed;
  int latest;
  int _selectedIndex = 0;

  void tapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    DataProvider readData = context.read<DataProvider>();
    DataProvider watchData = context.watch<DataProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: hpAppBar(context),
      drawer: hpDrawer(context),
      body: Container(
        child: ListView(
          children: List.generate(
            watchData.newsFeed.postList.length,
            (index) {
              latest = (readData.newsFeed.postList.length - 1) - index;
              return readData.newsFeed.postList[latest].renderCard(context);
            },
          ),
        ),
      ),
      bottomNavigationBar: hpBottomNavBar(context, _selectedIndex, tapItem),
    );
  }
}
