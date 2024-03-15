import 'package:flutter/material.dart';

class ProviderTheme extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  void changeThemeMode(ThemeMode newThemeMode) {
    if (appTheme == newThemeMode) {
      return;
    }
    appTheme = newThemeMode;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
