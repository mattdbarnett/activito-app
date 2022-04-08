
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
              child: Text(
                "Placeholder - Add Record",
                style: TextStyle(
                    fontSize: 32
                ),
              )
          ),
        ],
      ),
    );
  }
}