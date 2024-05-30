import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deck/backend/task/task_provider.dart';

import '../auth/auth_service.dart';
import '../models/task.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Task>> getTasksOnSpecificDate() async {
    List<Task> list = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('tasks').where('user_id', isEqualTo: AuthService().getCurrentUser()?.uid).get();
      print(AuthService().getCurrentUser()?.uid);
      // Iterate through the query snapshot to extract document data
      for (var doc in querySnapshot.docs) {
        String uid = doc.id;
        String title = doc['title'];
        String description = doc['description'];
        String userId = doc['user_id'];
        bool isDone = doc['is_done'];
        DateTime setDate = doc['set_date'].toDate();
        DateTime endDate = doc['end_date'].toDate();
        bool isDeleted = doc['is_deleted'];
        list.add(Task(uid, title, description, userId, isDone, setDate, endDate, isDeleted));
      }
    } catch (e) {
      print(e);
    }
    return list;
  }

  Future<void> updateTaskFromLoadedTasks(List<Task> list, Task task) async {
    try {
      DocumentSnapshot snapshot = await _firestore.doc(task.uid).get();
      if (!snapshot.exists) { return; }
      var data = snapshot.data() as Map<String, dynamic>;
      Task loadedTask = Task(
        data['uid'],
        data['title'],
        data['description'],
        data['userId'],
        data['isDone'],
        (data['createdAt'] as Timestamp).toDate(),
        (data['deadline'] as Timestamp).toDate(),
        data['isDeleted'],
      );
        for (int i = 0; i < list.length; i++) {
          if (list[i].uid == loadedTask.uid) {
            list[i] = loadedTask;
            print('Task updated: ${loadedTask.toString()}');
          }
        }
    } catch (e){
      print(e);
    }
  }

  Future<void> addTaskFromLoadedTasks(List<Task> list, Map<String, dynamic> taskData) async {
    final db = FirebaseFirestore.instance;
    final doc = await db.collection('tasks').add(taskData);

    Task task = Task(
      doc.id,
      taskData['title'],
      taskData['description'],
      taskData['user_id'],
      taskData['is_done'],
      taskData['set_date'],
      taskData['end_date'],
      taskData['is_deleted']
    );
    list.add(task);
  }

}