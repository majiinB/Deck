import 'dart:core';

class Deck{
  String _title;
  String _userId;
  String _deckId;
  bool _isDeleted;
  bool _isPrivate;

  // Constructor
  Deck(this._title, this._userId, this._deckId, this._isDeleted, this._isPrivate);

  // getters
  String get title => _title;
  String get userId => _userId;
  String get deckId => _deckId;
  bool get isDeleted => _isDeleted;
  bool get isPrivate => _isPrivate;

  // setters
  set title(String value) {
    _title = value;
  }
  set uid(String value) {
    _userId = value;
  }
  set deckId(String value) {
    _deckId = value;
  }
  set isDeleted(bool value) {
    _isDeleted = value;
  }
  set isPrivate(bool value) {
    _isPrivate = value;
  }
}