import 'dart:developer';

import 'package:translator/translator.dart';

class Translator {

  static Future<Map<String,String>> translateText({
    String name ='',
    String description ='',
    bool isSpanish = true}) async {
    final GoogleTranslator translator = GoogleTranslator();
    String from;
    String to;
    if (isSpanish) {
      from = 'es';
      to = 'en';
    }else{
      from = 'en';
      to = 'es';
    }
    try {
      final Translation translationName = await translator.translate(name, from: from, to: to);
      final Translation translationDescription = await translator.translate(description, from: from, to: to);

      return {
        'nameTrasn': translationName.text.toLowerCase(),
        'descriptionTrasn': translationDescription.text.toLowerCase(),
      };
    } catch (e) {
      log('Error during translation: $e');
      return {
        'nameTrasn': name,
        'descriptionTrasn': description
      };
    }
  }
}
