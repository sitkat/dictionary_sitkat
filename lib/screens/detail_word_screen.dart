import 'package:dictionary_sitkat/model/word.dart';
import 'package:flutter/material.dart';

class DetailWord extends StatelessWidget {
  // const DetailWord({Key? key}) : super(key: key);

  Word _word;
  DetailWord(this._word);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Word Details'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text(_word.title,),
            SizedBox(height: 20,),
            Text(_word.translation, ),
            SizedBox(height: 20,),
            Text(_word.description.toString(),),
          ],
        ),
      ),
    );
  }
}
