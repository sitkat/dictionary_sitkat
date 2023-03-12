class WordEntity {
  late int id;
  final String edition;
  final String title;
  final String translation;
  final String description;

  WordEntity({
    this.id = 0,
    required this.edition,
    required this.title,
    required this.translation,
    required this.description,
  });
}
