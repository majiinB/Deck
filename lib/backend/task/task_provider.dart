import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> editTask(Task task, Map<String, dynamic> data) async {
    final db = FirebaseFirestore.instance;
    await db.collection('tasks').doc(task.uid).update(data);
    print('added in firebase');
    await TaskService().updateTaskFromLoadedTasks(list, task);
    print('added in app list');
    notifyListeners();
  }


}