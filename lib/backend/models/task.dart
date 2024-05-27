import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deck/backend/auth/auth_service.dart';

class Task {
  String title;
  String description;
  final _userId;
  bool isDone;
  DateTime createdAt, deadline;

  Task(this.title, this.description, this._userId, this.isDone, this.createdAt, this.deadline);
  String get userId => _userId;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Future<List<Task>> getTasksOnSpecificDate() async {
    List<Task> list = [];
    DateTime currentDate = DateTime.now();
    try {
      Query query = _firestore.collection('tasks').where('user_id', isEqualTo: AuthService().getCurrentUser()?.uid)
          .where('set_date', isEqualTo: DateTime(currentDate.year, currentDate.month, currentDate.day)).orderBy('end-date');

      // Query the collection to get the documents
      QuerySnapshot querySnapshot = await query.get();

      // Iterate through the query snapshot to extract document data
      for (var doc in querySnapshot.docs) {
        String title = doc['title'];
        String description = doc['description'];
        String userId = doc['user_id'];
        bool isDone = doc['is_done'];
        DateTime setDate = doc['set_date'];
        DateTime endDate = doc['end_date'];
        list.add(Task(title, description, userId, isDone, setDate, endDate));
      }
    } catch (e) {
      print(e);
    }
    return list;
  }
}