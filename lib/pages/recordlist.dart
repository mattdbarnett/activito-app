
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';

class HistoryList extends StatefulWidget {
  const HistoryList ({Key? key}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryHomeState();
}

class _HistoryHomeState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HistColours.cBack,
      appBar: secondaryAppbar(context),
      body: Column(
        children: const [
          Text("Test")
        ],
      ),
    );
  }
}