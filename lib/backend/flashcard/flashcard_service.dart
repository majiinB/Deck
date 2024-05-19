
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/deck.dart';

class FlashcardService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Deck>> getDecksByUserId(String userId) async {
    List<Deck> decks = [];

    try {
      // Reference to the Firestore collection
      CollectionReference deckCollection = _firestore.collection('decks');

      // Query the collection for documents with the provided user ID
      QuerySnapshot querySnapshot = await deckCollection
          .where('user_id', isEqualTo: userId)
          .where('is_deleted', isEqualTo: false)
          .get();

      // Iterate through the query snapshot to extract document data
      for (var doc in querySnapshot.docs) {
        // Extract data from the document
        String title = (doc.data() as Map<String, dynamic>)['title'];
        String userId = (doc.data() as Map<String, dynamic>)['user_id'];
        bool isDeleted = (doc.data() as Map<String, dynamic>)['is_deleted'];
        bool isPrivate = (doc.data() as Map<String, dynamic>)['is_private'];
        String deckId = doc.id;

        // Extract created_at timestamp and convert it to DateTime
        Timestamp createdAtTimestamp = (doc.data() as Map<String, dynamic>)['created_at'];
        DateTime createdAt = createdAtTimestamp.toDate();

        // Create a new Deck object and add it to the list
        decks.add(Deck(title, userId, deckId, isDeleted, isPrivate, createdAt));
      }
    } catch (e) {
      // Handle errors
      print('Error retrieving decks: $e');
    }
    return decks;
  }

  Future<Deck?> getDecksByUserIdAndDeckId(String userId, String deckId) async {
    try {
      // Reference to the Firestore collection
      CollectionReference deckCollection = _firestore.collection('decks');

      // Fetch the document with the specified deckId
      DocumentSnapshot deckSnapshot = await deckCollection.doc(deckId).get();

      // Check if the document exists
      if (deckSnapshot.exists) {
        // Extract the data from the document
        Map<String, dynamic> deckData = deckSnapshot.data() as Map<String, dynamic>;

        // Extract the fields
        String deckUserId = deckData['user_id'];
        bool isDeleted = deckData['is_deleted'];

        // Check if the deck belongs to the user and is not deleted
        if (deckUserId == userId && !isDeleted) {
          String title = deckData['title'];
          bool isPrivate = deckData['is_private'];
          Timestamp createdAtTimestamp = deckData['created_at'];
          DateTime createdAt = createdAtTimestamp.toDate();

          // Create and return a Deck object
          return Deck(title, userId, deckId, isDeleted, isPrivate, createdAt);
        } else {
          // Deck does not belong to the user or is deleted
          return null;
        }
      } else {
        // Deck with the specified ID does not exist
        return null;
      }
    } catch (e) {
      // Handle errors
      print('Error retrieving deck: $e');
      return null;
    }
  }

  Future<Deck?> getLatestDeckLog(String userId) async {
    try {
      CollectionReference deckCollection = _firestore.collection('deck_log');

      // Query the collection for documents with the provided user ID and deck ID
      QuerySnapshot querySnapshot = await deckCollection
          .where('user_id', isEqualTo: userId)
          .orderBy('visited_at', descending: true)
          .limit(1)
          .get();

      // Check if any documents are returned
      if (querySnapshot.docs.isNotEmpty) {
        // Extract the latest deck log document
        Map<String, dynamic> latestDeckLogData =
        querySnapshot.docs.first.data() as Map<String, dynamic>;

        // Extract the deck ID from the latest deck log
        String deckId = latestDeckLogData['deck_id'];

        // Fetch the deck details using the deck ID
        Deck? decks = await getDecksByUserIdAndDeckId(userId, deckId);

        // Check if any deck is found
        if (decks != null) {
          // Return the deck found
          return decks;
        }
      }
    } catch (error) {
      // Handle any errors
      print('Error fetching latest deck log: $error');
    }
    // Return null if no deck is found or if an error occurs
    return null;
  }

}