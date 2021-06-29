import 'package:flutter/material.dart';

// displays in the body -> content
Widget switchItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      {
        return Text('Page 1: Home');
      }
      break;
    case 1:
      {
        return Text('Page 2: Live');
      }
    case 2:
      {
        return Text('Page 3: Chat');
      }
    case 3:
      {
        return Text('Page 4: Account');
      }
      break;
  }
}

// displays in the bottom navigation bar -> icon and title
Widget hpBottomNavBar(BuildContext context, int index, Function tapItem) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    // unselectedItemColor: Colors.grey[600],
    // showUnselectedLabels: true,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.tv_outlined), label: 'Live'),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), label: 'Account')
    ],
    currentIndex: index,
    selectedItemColor: Colors.purple[800],
    onTap: tapItem,
  );
}
