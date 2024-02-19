import 'package:flutter/material.dart';

class BackgroundColor extends InheritedWidget {
  BackgroundColor({super.key, required this.child}) : super(child: child);

  final Widget child;

  final Color backgroundColorDark = Color(0xff041a56);
  final Color backgroundColorLight = Color(0xff344ea3);
  final Color pinkColor = Color(0xff8e13bb);

  static BackgroundColor? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BackgroundColor>();
  }

  @override
  bool updateShouldNotify(BackgroundColor oldWidget) {
    return true;
  }
}
