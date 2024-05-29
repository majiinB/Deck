class Task {
  final String _uid;
  final String _title;
  final String _description;
  final String _userId;
  bool isDone;
  final DateTime _createdAt, _deadline;

  Task(this._uid, this._title, this._description, this._userId, this.isDone, this._createdAt, this._deadline);
  String get uid => _uid;
  String get userId => _userId;
  String get title => _title;
  bool get getIsDone => isDone;
  set setIsDone (bool value){
    isDone = value;
  }
  String get description => _description;
  DateTime get createdAt => _createdAt;
  DateTime get deadline => _deadline;
}