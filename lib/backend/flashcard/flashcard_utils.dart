import 'dart:math';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../../pages/misc/widget_method.dart';

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
  String capitalizeFirstLetterOfWords(String input) {
    if (input.isEmpty) {
      return input;
    }

    // Split the input string into words
    List<String> words = input.split(' ');

    // Capitalize the first letter of each word
    List<String> capitalizedWords = words.map((word) {
      if (word.isEmpty) {
        return word; // Return empty string as is
      }
      // Capitalize the first letter and concatenate with the rest of the word
      return '${word[0].toUpperCase()}${word.substring(1)}';
    }).toList();

    // Join the capitalized words back into a single string
    return capitalizedWords.join(' ');
  }
  String cleanSpaces(String input) {
    // Use a regular expression to replace multiple consecutive spaces with a single space
    return input.replaceAll(RegExp(r'\s+'), ' ');
  }
  Future<String?> getIPAddress() async {
    final NetworkInfo networkInfo = NetworkInfo();
    try {
      String? ipAddress = await networkInfo.getWifiIP();
      return ipAddress;
    } catch (e) {
      print('Failed to get IP address: $e');
      return null;
    }
  }
}