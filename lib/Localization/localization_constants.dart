import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_localization.dart';

String? getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context)!.getTranslatedValue(key);
}

const String english = 'en';
const String arabic = 'ar';

const String Language_Code = 'langueageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  await pref.setString(Language_Code, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale temp;
  switch (languageCode) {
    case english:
      temp = Locale(languageCode, 'US');
      break;
    case arabic:
      temp = Locale(languageCode, 'EG');
      break;
    default:
      temp = const Locale(arabic, 'EG');
  }
  return temp;
}

Future<Locale> getLocale() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String languageCode = pref.getString(Language_Code) ?? arabic;

  return _locale(languageCode);
}
