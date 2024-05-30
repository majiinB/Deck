import 'package:cloud_firestore/cloud_firestore.dart';

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
        String title = doc['title'];
        String description = doc['description'];
        String userId = doc['user_id'];
        bool isDone = doc['is_done'];
        DateTime setDate = doc['set_date'].toDate();
        DateTime endDate = doc['end_date'].toDate();
        list.add(Task(title, description, userId, isDone, setDate, endDate));
      }
    } catch (e) {
      print(e);
    }
    return list;
  }
}