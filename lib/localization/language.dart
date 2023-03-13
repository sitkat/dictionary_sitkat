import 'package:flutter/material.dart';

class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇸", "English", "en"),
      Language(2, "🇷🇺", "Russian", "ru"),
      Language(3, "", "Esperanto", "eo"),
    ];
  }
}
