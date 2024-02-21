import 'package:flutter/material.dart';
import 'package:todo_list_notifier/models/task_list_model.dart';

class TaskController {
  final ValueNotifier<List<TaskModel>> _taskList =
      ValueNotifier<List<TaskModel>>([]);
  ValueNotifier<List<TaskModel>> get taskList => _taskList;

  void addTask(value) {
    _taskList.value = List.from(_taskList.value)..add(TaskModel(name: value));
  }

  void removeTask(TaskModel task) {
    _taskList.value.remove(task);
  }
}
