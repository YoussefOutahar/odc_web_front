import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(228, 87, 46, 1);
const kSecondaryColor = Color.fromARGB(255, 76, 95, 171);
const kBgColor = Color.fromARGB(51, 76, 95, 171);
const kDarkBlackColor = Color(0xFF191919);
const kBodyTextColor = Color(0xFF666666);

const kDefaultPadding = 20.0;
const kMaxWidth = 1232.0;
const kDefaultDuration = Duration(milliseconds: 250);

abstract class AppConstants {
  static const linkedInProfileURL = 'https://linkedin.com';
  static const twitterURL = 'https://twitter.com';
  static const instagramProfileURL = 'https://instagram.com';
  static const facebookProfileURL = 'https://www.facebook.com';
  static const eMail = 'mailto:kamranbekirovyz@gmail.com';
}
