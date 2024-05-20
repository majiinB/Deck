import 'package:cloud_firestore/cloud_firestore.dart';

class Card {
  final String _cardId;
  String question;
  String answer;
  bool isStarred;
  bool isDeleted;

  Card(this.question, this.answer, this.isStarred, this._cardId, this.isDeleted);

  String get cardId => _cardId;

  //Methods
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> updateDeleteStatus(bool newStatus, String deckId) async {
    try {
      // Reference to the Firestore document
      DocumentReference deckRef = _firestore.collection('decks').doc(deckId)
          .collection('questions')
          .doc(_cardId);

      // Update only the 'title' field of the document
      await deckRef.update({'is_deleted': newStatus});
      isDeleted = newStatus;
      print('Deck status updated successfully');
      return true;
    } catch (e) {
      // Handle any errors that might occur during the update
      print('Error updating deck status: $e');
      return false;
    }
  }
  Future<bool> updateStarredStatus(bool newStatus, String deckId) async {
    try {
      // Reference to the Firestore document
      DocumentReference deckRef = _firestore.collection('decks').doc(deckId)
          .collection('questions')
          .doc(_cardId);

      // Update only the 'title' field of the document
      await deckRef.update({'is_starred': newStatus});
      isDeleted = newStatus;
      print('Deck status updated successfully');
      return true;
    } catch (e) {
      // Handle any errors that might occur during the update
      print('Error updating deck status: $e');
      return false;
    }
  }
}
