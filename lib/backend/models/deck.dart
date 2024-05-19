import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'card.dart';

class Deck{
  String _title;
  String _userId;
  String _deckId;
  bool _isDeleted;
  bool _isPrivate;
  DateTime _createdAt;

  // Constructor
  Deck(this._title, this._userId, this._deckId, this._isDeleted, this._isPrivate, this._createdAt);

  // getters
  String get title => _title;
  String get userId => _userId;
  String get deckId => _deckId;
  bool get isDeleted => _isDeleted;
  bool get isPrivate => _isPrivate;
  DateTime get createdAt => _createdAt;

  // setters
  set title(String value) {
    _title = value;
  }
  set isDeleted(bool value) {
    _isDeleted = value;
  }
  set isPrivate(bool value) {
    _isPrivate = value;
  }
  set createdAt(DateTime value) {
    _createdAt = value;
  }

  // Methods
  // Change in field methods
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> updateDeckTitle(String newTitle) async {
    try {
      // Reference to the Firestore document
      DocumentReference deckRef = _firestore.collection('decks').doc(_deckId);

      // Update only the 'title' field of the document
      await deckRef.update({'title': newTitle});
      _title = newTitle;
      print('Deck title updated successfully');
      return true;
    } catch (e) {
      // Handle any errors that might occur during the update
      print('Error updating deck title: $e');
      return false;
    }
  }
  Future<bool> updateDeleteStatus(bool newStatus) async {
    try {
      // Reference to the Firestore document
      DocumentReference deckRef = _firestore.collection('decks').doc(_deckId);

      // Update only the 'title' field of the document
      await deckRef.update({'is_deleted': newStatus});
      _isDeleted = newStatus;
      print('Deck status updated successfully');
      return true;
    } catch (e) {
      // Handle any errors that might occur during the update
      print('Error updating deck status: $e');
      return false;
    }
  }

  // Access subcollections method
  Future<List<Card>> getCard() async {
    List<Card> questions = [];

    try {
      // Reference to the questions subcollection
      CollectionReference questionsCollection = _firestore
          .collection('decks')
          .doc(deckId)
          .collection('questions');

      // Query the collection to get the documents
      QuerySnapshot querySnapshot = await questionsCollection.get();

      // Iterate through the query snapshot to extract document data
      querySnapshot.docs.forEach((doc) {
        String question = (doc.data() as Map<String, dynamic>)['question'];
        String answer = (doc.data() as Map<String, dynamic>)['answer'];
        bool isStarred = (doc.data() as Map<String, dynamic>)['is_starred'];

        // Create a new Question object and add it to the list
        questions.add(Card(question, answer, isStarred));
      });
    } catch (e) {
      // Handle any errors that might occur during the query
      print('Error retrieving questions: $e');
    }

    return questions;
  }
}