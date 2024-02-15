import 'package:flutter/cupertino.dart';

import '../models/todo_model.dart';

class HomeController extends ChangeNotifier {
  var todos = <TodoModel>[];

  addTodos(
      {required String title,
      required bool completed,
      required String hoursSpent,
      required String hoursRemaining}) {
    todos.add(TodoModel(
      title: title,
      completed: completed,
      hoursSpent: hoursSpent,
      hoursRemaining: hoursRemaining,
    ));
    notifyListeners();
  }
}
