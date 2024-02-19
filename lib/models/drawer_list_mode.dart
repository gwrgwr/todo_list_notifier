import 'package:flutter/material.dart';

class DrawerList {
  final String name;
  final Icon icon;

  DrawerList({required this.icon, required this.name});

  static List<DrawerList> getDrawerList() {
    List<DrawerList> list = [
      DrawerList(icon: Icon(Icons.home, color: Colors.white.withOpacity(0.4),), name: 'Home'),
      DrawerList(icon: Icon(Icons.dashboard, color: Colors.white.withOpacity(0.4),), name: "Dashboard"),
      DrawerList(icon: Icon(Icons.account_box, color: Colors.white.withOpacity(0.4),), name: 'Profile'),
      DrawerList(icon: Icon(Icons.analytics, color: Colors.white.withOpacity(0.4),), name: 'Analytics'),
      DrawerList(icon: Icon(Icons.settings, color: Colors.white.withOpacity(0.4),), name: 'Settings'),
    ];

    return list;
  }
}
