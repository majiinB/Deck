import 'dart:core';

class Deck{
  String _title;
  String _userId;
  String _deckId;

  // Constructor
  Deck(this._title, this._userId, this._deckId);

  // getters
  String get title => _title;
  String get userId => _userId;
  String get deckId => _deckId;

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
}