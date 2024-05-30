import 'dart:math';

import 'package:flutter/material.dart';

class FlashcardUtils{
  static final ValueNotifier<bool> updateSettingsNeeded = ValueNotifier<bool>(false);
  static final ValueNotifier<bool> updateLatestReview = ValueNotifier<bool>(false);
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