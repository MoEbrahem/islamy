import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String LanguageCode = "en";

  void changeLang(String newlangcode) {
    if (newlangcode == LanguageCode) {
      return;
    }
    LanguageCode = newlangcode;
    notifyListeners();
  }
}
