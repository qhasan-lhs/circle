import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
        elevation: 5.0,
        textStyle: TextStyle(fontSize: 15.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        minimumSize: Size(200.0, 35.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
