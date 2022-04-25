import 'package:flutter/material.dart';
import 'shared/colours.dart';
import 'package:history_logging_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Manrope',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: HistColours.cBack,
            secondary: HistColours.cBack,
            brightness: Brightness.light,
            /* light theme settings */
          )),
      home: const HistoryHome(),
    );
  }
}