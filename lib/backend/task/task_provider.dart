import 'package:deck/backend/models/task.dart';
import 'package:deck/backend/task/task_service.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> list = [];

  List<Task> get getList => list;
  set setList(List<Task> list) {
    this.list = list;
    notifyListeners();
  }

  Future<void> loadTasks() async {
    list = await TaskService().getTasksOnSpecificDate();
    notifyListeners();
  }

  Future<void> addTask(Map<String, dynamic> taskData) async {
    await TaskService().addTaskFromLoadedTasks(list, taskData);
    notifyListeners();
  }


}