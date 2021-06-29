import 'package:flutter/material.dart';

Widget menuButton(BuildContext context) {
  return PopupMenuButton<String>(
    onSelected: handleClick,
    itemBuilder: (BuildContext context) {
      return {'Save', 'Show Profile', 'Report'}.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    },
  );
}

void handleClick(String value) {
  switch (value) {
    case 'Save':
      break;
    case 'Show Profile':
      break;
    case 'Report':
      break;
  }
}
