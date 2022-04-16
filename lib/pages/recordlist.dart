
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import 'package:history_logging_app/classes/histglobals.dart' as globals;

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
      appBar: secondaryAppbar(
        context,
        [
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: HistColours.cHighlight,
              elevation: 1,
              fixedSize: const Size(47, 47),
              shape: const CircleBorder(),
          ),
            child: const Icon(Icons.filter_alt)
          ),
          TextButton(
            onPressed: () {  },
            style: TextButton.styleFrom(
              backgroundColor: HistColours.cHighlight,
              elevation: 1,
              fixedSize: const Size.fromHeight(47),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
            ),
            child: const Text(
              "Clear",
              style: TextStyle(
                color: HistColours.cBack,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),

        ]
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
                ),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: 10,
                ),
              decoration: BoxDecoration(
              border: Border.all(color: HistColours.cHighlight),
              borderRadius: const BorderRadius.all(
              Radius.circular(20),
              ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: globals.getRecordWidgets(context),
                )
              )
            )
          ),
        ],
      ),
    );
  }
}