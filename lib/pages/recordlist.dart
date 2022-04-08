
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
        children: [
          Row(
            children: [
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: HistColours.cHighlight,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                ),
                onPressed: () {  },
                child: const Text(
                  "Clear",
                  style: TextStyle(
                    color: HistColours.cBack,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
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
            )
          ),
        ],
      ),
    );
  }
}