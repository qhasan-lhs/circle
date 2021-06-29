import 'package:flutter/material.dart';

class BorderTextField extends StatelessWidget {
  BorderTextField(
      {this.keyboardType,
      @required this.obscureText,
      this.onChanged,
      this.hintText,
      this.prefixIcon});

  final TextInputType keyboardType;
  final bool obscureText;
  final Function onChanged;
  final String hintText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
