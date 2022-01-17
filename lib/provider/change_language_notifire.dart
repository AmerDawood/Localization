

import 'package:flutter/material.dart';
import 'package:localization/prefs/app_settings_prefs.dart';

class ChangeLanguageNotifier extends ChangeNotifier{

  String languageCode = AppSettingsPreferances().langCode;
  void changeLanguage({required String languageCode}){
    this.languageCode =languageCode;
    AppSettingsPreferances().SaveLanguage(language: languageCode);
    notifyListeners();
  }


}