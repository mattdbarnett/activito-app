
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';

class HistoryAddType extends StatefulWidget {
  const HistoryAddType ({Key? key}) : super(key: key);

  @override
  State<HistoryAddType> createState() => _HistoryAddTypeState();
}

class _HistoryAddTypeState extends State<HistoryAddType> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        heroTag: "btnadd",
        tooltip: 'Add Type',
        backgroundColor: HistColours.cHighlight,
        child: const Icon(Icons.add),
      ),
    );
  }
}