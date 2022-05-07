
import 'package:flutter/material.dart';
import 'package:history_logging_app/shared/cleardialog.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import '../shared/globals.dart' as globals;

final ValueNotifier<bool> recordListStateNotifier = ValueNotifier(false);

class HistoryList extends StatefulWidget {
  const HistoryList ({Key? key}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryHomeState();
}

class _HistoryHomeState extends State<HistoryList> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: recordListStateNotifier,
        builder: (_, recordListState, __)
    {
      return Scaffold(
        backgroundColor: HistColours.cBack,
        appBar: secondaryAppbar(
            context,
            [
              const Spacer(),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return clearDialog(context,
                            "Are you sure you want to clear all records?",
                            "recordsClear");
                      });
                },
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
                    color: HistColours.cBackLight,
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
    });
  }
}

Widget recordContainer(BuildContext context, List<String> currentRecord) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Column(
    children: [
      Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
              width: screenWidth * 0.776,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: HistColours.cHighlight),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: currentRecord[0], style: recordStyleImp),
                              TextSpan(text: currentRecord[1], style: recordStyle),
                              TextSpan(text: currentRecord[2], style: recordStyle),
                              TextSpan(text: currentRecord[3], style: recordStyle),
                              TextSpan(text: currentRecord[4], style: recordStyleImp),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              )),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

TextStyle recordStyle = TextStyle(
  color: HistColours.cText,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

TextStyle recordStyleImp = TextStyle(
  color: HistColours.cText,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);