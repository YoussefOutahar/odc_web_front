// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:js' as js;

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

void launchUrl(String url, {bool newTab = true}) {
  js.context.callMethod(
    'open',
    [url, newTab ? '_blank' : '_self'],
  );
}

List<List<T>> splitListIntoPairs<T>(List<T> originalList) {
  List<List<T>> resultList = [];
  int length = originalList.length;

  for (int i = 0; i < length; i += 2) {
    if (i + 1 < length) {
      List<T> pair = [originalList[i], originalList[i + 1]];
      resultList.add(pair);
    } else {
      List<T> single = [originalList[i]];
      resultList.add(single);
    }
  }

  return resultList;
}

List<List<T>> splitListIntoSubsets<T>(List<T> originalList, int subsetLength) {
  List<List<T>> resultList = [];
  int length = originalList.length;

  for (int i = 0; i < length; i += subsetLength) {
    List<T> subset = originalList.sublist(i, min(i + subsetLength, length));
    resultList.add(subset);
  }

  return resultList;
}

String extractFirstLetterFromWords(String text) {
  List<String> words = text.split(" ");
  String firstLetters = "";

  for (String word in words) {
    firstLetters += word[0];
  }

  return firstLetters;
}
