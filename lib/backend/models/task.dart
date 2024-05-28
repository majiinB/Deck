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
}