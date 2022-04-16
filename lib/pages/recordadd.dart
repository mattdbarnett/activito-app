
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import 'package:history_logging_app/classes/histglobals.dart' as globals;

class HistoryAddRecord extends StatefulWidget {
  const HistoryAddRecord ({Key? key}) : super(key: key);

  @override
  State<HistoryAddRecord> createState() => _HistoryAddRecordState();
}

class _HistoryAddRecordState extends State<HistoryAddRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HistColours.cBack,
      appBar: secondaryAppbar(context),
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: globals.getTypeWidgets(context, "tAddContainer"),
            )
          )
        )
      ),
    );
  }
}