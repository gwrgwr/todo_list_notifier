import 'package:flutter/material.dart';

class TodoModel {
  final String title;
  bool completed;
  final String hoursSpent;
  final String hoursRemaining;
  final Color colorCard;

  TodoModel({
    required this.title,
    required this.completed,
    required this.hoursSpent,
    required this.hoursRemaining,
    required this.colorCard
  });


  // TodoModel test for interfaces.
  static TodoModel stub() => TodoModel(
        title: 'test',
        completed: true,
        hoursSpent: "10hrs",
        hoursRemaining: "2hrs",
        colorCard: Colors.black
      );
}
