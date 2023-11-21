import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:odc/Services/constants.dart';

import '../Utils/utils.dart';

class AppThemes {
  // Theme Definitions
  static final ThemeData _defaultTheme = ThemeData(
    primarySwatch: createMaterialColor(kPrimaryColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 36.0,
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 24.0,
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
  );

  static final ThemeData _alternativeTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontFamily: 'Montserrat',
      ),
      displayMedium: TextStyle(
        fontSize: 36.0,
        fontFamily: 'Montserrat',
      ),
      displaySmall: TextStyle(
        fontSize: 24.0,
        fontFamily: 'Montserrat',
      ),
      headlineMedium: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Montserrat',
      ),
      headlineSmall: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Montserrat',
      ),
      titleLarge: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
      ),
      bodyLarge: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  static ThemeData get deafult => _defaultTheme;

  static ThemeData get alternative => _alternativeTheme;

  // Theme Switching Mechanisms
  final _box = GetStorage();
  final _key = 'isDarkMode';

  void _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  ThemeMode get themeMode => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
}
