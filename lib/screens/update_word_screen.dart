import 'package:dictionary_sitkat/data_base/data_base_helper.dart';
import 'package:dictionary_sitkat/model/word.dart';
import 'package:dictionary_sitkat/screens/home_screen.dart';
import 'package:flutter/material.dart';

class UpdateWord extends StatefulWidget {
  Word _word;

  UpdateWord(this._word);

  @override
  State<UpdateWord> createState() => _UpdateWordState();
}

class _UpdateWordState extends State<UpdateWord> {
  var helper;

  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerTranslation = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();

  @override
  void initState() {
    helper = DbHelper.instance;

    _controllerTitle.text = widget._word.title;
    _controllerTranslation.text = widget._word.translation;
    _controllerDescription.text = widget._word.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _controllerTitle,
            ),
            TextField(
              controller: _controllerTranslation,
            ),
            TextField(
              controller: _controllerDescription,
            ),
            Container(
              width: 350,
              height: 40,
              child: TextButton(
                child: Text('Save'),
                onPressed: () async {
                  await helper.onUpdateWord(Word(
                      id: widget._word.id,
                      edition: DateTime.now()
                          .add(const Duration(hours: 3))
                          .toString(),
                      title: _controllerTitle.text,
                      translation: _controllerTranslation.text,
                      description: _controllerDescription.text));
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                //   style: ButtonStyle(
                //     backgroundColor:
                //     MaterialStateProperty.all(Colors.grey[300]),
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(24.0)),
                //     ),
                //   ),
                //   onPressed: () {},
                //   child: const Text(
                //   'Войти',
                //   style: TextStyle(
                //     color: Colors.lightBlue,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
