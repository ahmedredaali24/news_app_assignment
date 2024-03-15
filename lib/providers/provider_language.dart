import 'package:flutter/material.dart';

class ProviderLanguage extends ChangeNotifier {
  String appLanguage = "en";

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }
}
