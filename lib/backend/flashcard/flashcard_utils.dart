import 'dart:math';

class FlashcardUtils{

  void shuffleList(List items) {
    final random = Random();
    for (var i = items.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = items[i];
      items[i] = items[j];
      items[j] = temp;
    }
  }
}