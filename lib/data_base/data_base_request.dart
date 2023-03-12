abstract class DataBaseRequest {
  /// Запрос для создания таблицы Words
  static const String _createTableWord =
      'CREATE TABLE "$tableWord" ("id" INTEGER,"edition" DATE, "title" TEXT NOT NULL, "translation" TEXT NOT NULL, "description" TEXT, PRIMARY KEY("id" AUTOINCREMENT))';

  static String deleteTable(String table) => 'DROP TABLE $table';

  /// Таблица Слов
  ///
  /// Поля таблицы: id, edition, title, translation, description

  static const String tableWord = 'Word';

  static const List<String> tableList = [
    tableWord,
  ];

  static const List<String> tableCreateList = [
    _createTableWord,
  ];
}
