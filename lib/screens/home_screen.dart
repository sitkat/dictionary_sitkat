import 'package:dictionary_sitkat/data_base/data_base_helper.dart';
import 'package:dictionary_sitkat/localization/language.dart';
import 'package:dictionary_sitkat/model/word.dart';
import 'package:dictionary_sitkat/screens/create_word_screen.dart';
import 'package:dictionary_sitkat/screens/detail_word_screen.dart';
import 'package:dictionary_sitkat/screens/update_word_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var helper;

  List<Map<String, dynamic>> _words = [];
  List<Map<String, dynamic>> items = [];

  void _refreshWords() async {
    final data = await helper.getWords();
    setState(() {
      _words = data;
      items = _words;
      // _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    helper = DbHelper.instance;
    _refreshWords();
  }

  void filterSearch(String query) async {
    var dummySearchList = _words;
    if (query.isNotEmpty) {
      var dummyListData = <Map<String, dynamic>>[];
      dummySearchList.forEach((item) {
        var word = Word.toFromMap(item);
        if (word.title.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items = <Map<String, dynamic>>[];
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _refreshWords();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esperanto'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  // Locale _locale = await setLocale(language.languageCode);
                  // MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.language),
          //   onPressed: () => Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (context) => CreateWord())),
          // )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filterSearch(value);
                });
              },
              decoration: InputDecoration(
                  hintText: 'Search...',
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  Word word = Word.toFromMap(items[i]);
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(word.title),
                      subtitle: Text(word.translation),
                      trailing: Column(
                        children: <Widget>[
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  helper.onDeleteWord(word.id);
                                  _refreshWords();
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UpdateWord(word)));
                              },
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailWord(word)));
                      },
                    ),
                  );
                }),
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CreateWord())),
          ),
        ],
      ),
    );
  }
}
