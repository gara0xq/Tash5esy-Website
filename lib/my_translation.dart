import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyTranslation extends Translations {
  static Map<String, Map<String, String>> translations = {'en': {}, 'ar': {}};

  static Future<void> loadTranslations() async {
    final enJson = await rootBundle.loadString('assets/translation/en.json');
    final arJson = await rootBundle.loadString('assets/translation/ar.json');
    translations['en'] = Map<String, String>.from(json.decode(enJson));
    translations['ar'] = Map<String, String>.from(json.decode(arJson));
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
