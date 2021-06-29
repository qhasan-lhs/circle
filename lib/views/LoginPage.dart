import 'package:flutter/material.dart';
import 'package:circle/widgets/RoundedButton.dart';
import 'package:circle/widgets/BorderTextField.dart';
import 'package:circle/views/HomePage.dart';

class LoginPage extends StatelessWidget {
  static String id = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/circle_logo.png',
                scale: 2.5,
              ),
              SizedBox(height: 20.0),
              BorderTextField(
                obscureText: false,
                hintText: 'User ID',
                prefixIcon: Icon(Icons.account_circle_outlined),
              ),
              SizedBox(height: 5.0),
              BorderTextField(
                obscureText: true,
                hintText: 'Password',
                prefixIcon: Icon(Icons.vpn_key_outlined),
              ),
              SizedBox(height: 15.0),
              RoundedButton(
                title: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
