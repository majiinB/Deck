
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/deck.dart';

class FlashcardService{
  Future<List<Deck>> getDecksByUserId(String userId) async {
    List<Deck> decks = [];

    try {
      // Reference to the Firestore collection
      CollectionReference deckCollection = FirebaseFirestore.instance.collection('decks');

      // Query the collection for documents with the provided user ID
      QuerySnapshot querySnapshot = await deckCollection.where('user_id', isEqualTo: userId).get();

      // Iterate through the query snapshot to extract document data
      querySnapshot.docs.forEach((doc) {
        // Extract data from the document
        String title = (doc.data() as Map<String, dynamic>)['title'];
        print("Title: " + title);
        String userId = (doc.data() as Map<String, dynamic>)['user_id'];
        print("UserId: " + userId);
        String deckId = doc.id;
        print("Deck Id: " + deckId);

        // Create a new Deck object and add it to the list
        decks.add(Deck(title, userId, deckId));
      });
    } catch (e) {
      // Handle any errors that might occur during the query
      print('Error retrieving decks: $e');
    }
    return decks;
  }
}