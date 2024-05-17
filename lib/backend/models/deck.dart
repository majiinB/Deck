import 'dart:core';

class Deck{
  String _title;
  String _uid;

  // Constructor
  Deck(this._title, this._uid);

  // getters
  String get title => _title;
  String get uid => _uid;

  // setters
  set title(String value) {
    _title = value;
  }
  set uid(String value) {
    _uid = value;
  }
}