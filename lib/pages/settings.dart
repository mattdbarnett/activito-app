
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';

class HistorySettings extends StatefulWidget {
  const HistorySettings ({Key? key}) : super(key: key);

  @override
  State<HistorySettings> createState() => _HistorySettingsState();
}

class _HistorySettingsState extends State<HistorySettings> {
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
                "Placeholder - Settings",
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