
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
      querySnapshot.docs.forEach((doc) {
        // Extract data from the document
        String title = (doc.data() as Map<String, dynamic>)['title'];
        print("Title: " + title);
        String userId = (doc.data() as Map<String, dynamic>)['user_id'];
        print("UserId: " + userId);
        bool isDeleted = (doc.data() as Map<String, dynamic>)['is_deleted'];
        print("is deleted: " + isDeleted.toString());
        bool isPrivate = (doc.data() as Map<String, dynamic>)['is_private'];
        print("is private: " + isPrivate.toString());
        String deckId = doc.id;
        print("Deck Id: " + deckId);

        // Extract created_at timestamp and convert it to DateTime
        Timestamp createdAtTimestamp = (doc.data() as Map<String, dynamic>)['created_at'];
        DateTime createdAt = createdAtTimestamp.toDate();
        print("Created At: " + createdAt.toString());

        // Create a new Deck object and add it to the list
        decks.add(Deck(title, userId, deckId, isDeleted, isPrivate, createdAt));
      });
    } catch (e) {
      // Handle any errors that might occur during the query
      print('Error retrieving decks: $e');
    }
    return decks;
  }
}