import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:circle/models/DataProvider.dart';

import 'package:circle/views/LoadingPage.dart';
import 'package:circle/views/WelcomePage.dart';
import 'package:circle/views/LoginPage.dart';
import 'package:circle/views/HomePage.dart';

void main() => runApp(Circle());

class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DataProvider())],
      child: MaterialApp(
        //initialRoute: HomePage.id,
        initialRoute: LoadingPage.id,
        routes: {
          LoadingPage.id: (context) => LoadingPage(),
          WelcomePage.id: (context) => WelcomePage(),
          LoginPage.id: (context) => LoginPage(),
          HomePage.id: (context) => HomePage(),
        },
      ),
    );
  }
}
