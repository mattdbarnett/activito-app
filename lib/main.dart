import 'package:flutter/material.dart';
import 'shared/colours.dart';
import 'package:history_logging_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
      builder: (_, mode, __) {
      return MaterialApp(
        title: 'Activity Logger',
        theme: ThemeData(
          fontFamily: 'Manrope',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: HistColours.cBack,
            secondary: HistColours.cBack,
            brightness: Brightness.light,
            /* light theme settings */
          )),
        darkTheme: ThemeData(
            fontFamily: 'Manrope',
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: HistColours.cBack,
              secondary: HistColours.cBack,
              brightness: Brightness.dark,
              /* light theme settings */
            )),
        themeMode: mode,
        home: const HistoryHome(),
      );
    });
  }
}