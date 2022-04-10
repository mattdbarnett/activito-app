
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import 'package:history_logging_app/classes/recordtype.dart';
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
              children: getRecordTypes(context),
            )
          )
        )
      ),
    );
  }
}

List<Widget> getRecordTypes(BuildContext context) {
  List<Widget> recordTypes = [];

  //EXAMPLE TYPE - TO BE REMOVED
  globals.typesAdd("test", "test", "test test", ["test test"]);


  if (globals.types.isNotEmpty) {
    for (int x = 0; x <= globals.types.length - 1; x++) {
      recordTypes.add(recordTypeContainer(context, globals.types[x]));
    }
  }
  return recordTypes;
}

Widget recordTypeContainer(BuildContext context, RecordType currentType) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
      height: 125,
      width: screenWidth * 0.9,
      margin: const EdgeInsets.only(
        bottom: 20
      ),
      decoration: const BoxDecoration(
        color: HistColours.cHighlight,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 15),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(text: 'Type: ',
                      style: TextStyle(
                        color: HistColours.cBack,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(text: currentType.getTitle(),
                      style: const TextStyle(
                        color: HistColours.cBack,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  currentType.getAuthor() + ", " + currentType.getCreationDT(),
                  style: const TextStyle(
                    color: HistColours.cBack,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 15),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(text: 'Description: ',
                        style: TextStyle(
                          color: HistColours.cBack,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(text: currentType.getDesc(),
                        style: const TextStyle(
                          color: HistColours.cBack,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
}