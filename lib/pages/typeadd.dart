
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';

class HistoryTypeAdd extends StatefulWidget {
  const HistoryTypeAdd ({Key? key}) : super(key: key);

  @override
  State<HistoryTypeAdd> createState() => _HistoryTypeAddState();
}

class _HistoryTypeAddState extends State<HistoryTypeAdd> {
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
                "Placeholder - Add Type",
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