import 'package:dictionary_sitkat/app_router/custom_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dictionary_sitkat/data_base/data_controller.dart';
import 'package:dictionary_sitkat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_sitkat/data_base/data_base_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.instance.init();
  runApp(const MyApp());
  DataController dataController = DataController();
  dataController.converter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Esperanto',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ru'), // Russian
        Locale('eo'), // Esperanto
      ],
      home: HomeScreen(),
      // onGenerateRoute: CustomRouter.generatedRoute(),
      // initialRoute: homeRoute,
    );
  }
}
