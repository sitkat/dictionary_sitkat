import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataController {
  String? _edition;
  String _title = "";
  String _translation = "";
  String _description = "";

  void converter() async {
    WidgetsFlutterBinding.ensureInitialized();
    // File file = File(readFileAsync('assets/test.txt').toString());
    readFileAsync('assets/test.txt').toString();
  }

  Future<dynamic> readFileAsync(String filePath) async {
    String data = await rootBundle.loadString(filePath);
    return LineSplitter.split(data).forEach((line) {
      if (isDate(line)) {
        _edition = line.characters.take(16).string;
        print('$_edition');
      } else if (line.startsWith('[')) {
        int firstMatch = line.indexOf('[');
        int secondMatch = line.indexOf(']');

        if (_title.contains("")) {
          _title = line.substring(firstMatch + 1, secondMatch).trim();
        } else {
          _title = _title.trim() +
              " " +
              line.substring(firstMatch + 1, secondMatch).trim();
        }
        print('$_title');

        _translation = line.substring(secondMatch + 1).trim();
        print('$_translation');
        // if(line.)
      } else if (line.isEmpty) {
        _edition = "";
        _title = "";
        _translation = "";
        _description = "";
        print('');
      }
      // print('$line');
    });
  }

  bool isDate(String str) {
    try {
      DateTime.parse(str.characters.take(16).string);
      return true;
    } catch (e) {
      return false;
    }
  }
}
