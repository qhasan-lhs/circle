import 'package:flutter/material.dart';
import 'package:circle/widgets/RoundedButton.dart';
import 'package:circle/views/LoginPage.dart';

class WelcomePage extends StatelessWidget {
  static String id = 'welcomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(),
            Image.asset(
              'images/circle_logo.png',
              scale: 2.0,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: RoundedButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
