import 'package:dictionary_sitkat/entity/word_entity.dart';

class Word extends WordEntity {
  Word({
    super.id = 0,
    required super.edition,
    required super.title,
    required super.translation,
    required super.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'edition': edition,
      'title': title,
      'translation': translation,
      'description': description,
    };
  }

  factory Word.toFromMap(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as int,
      edition: json['edition'],
      title: json['title'],
      translation: json['translation'],
      description: json['description'],
    );
  }
}
