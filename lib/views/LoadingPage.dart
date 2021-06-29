import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:circle/models/DataProvider.dart';

import 'package:circle/views/HomePage.dart';

class LoadingPage extends StatelessWidget {
  static String id = 'loadingPage';

  DataProvider readData;
  DataProvider watchData;

  @override
  Widget build(BuildContext context) {
    readData = context.read<DataProvider>();
    watchData = context.watch<DataProvider>();

    watchData.loadNewsFeed().then(
      (result) {
        if (result == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },
    );
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
