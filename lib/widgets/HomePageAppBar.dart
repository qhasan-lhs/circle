import 'package:flutter/material.dart';

import 'package:circle/widgets/PostForm.dart';

Widget hpAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.purple[800],
    actions: <Widget>[
      Container(
        width: 300.0,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            suffixIcon: Icon(
              Icons.search_outlined,
              color: Colors.purple[800],
            ),
          ),
        ),
      ),
      Container(
        width: 50,
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: IconButton(
          icon: Icon(Icons.photo_camera_outlined, color: Colors.purple[800]),
          onPressed: () {
            //Navigator.pushNamed(context, PostPage.id);
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) => PostForm(),
            );
          },
        ),
      ),
    ],
  );
}
