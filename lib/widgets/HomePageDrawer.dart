import 'package:flutter/material.dart';

Widget hpDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 60),
        ),
        ListTile(
            leading: Icon(Icons.person_add), title: Text('Discover People')),
        ListTile(
            leading: Icon(Icons.bookmark_outline), title: Text('Saved Items')),
        ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
      ],
    ),
  );
}
