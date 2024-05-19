class Card {
  String _question;
  String _answer;
  bool _isStarred;

  Card(this._question, this._answer, this._isStarred);

  String get question => _question;
  String get answer => _answer;
  bool get isStarred => _isStarred;


  set question(String value) {
    _question = value;
  }
  set answer(String value) {
    _answer = value;
  }
  set isStarred(bool value) {
    _isStarred = value;
  }
}
