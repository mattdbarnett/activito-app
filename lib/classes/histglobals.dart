
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/record.dart';
import 'package:history_logging_app/classes/recordtype.dart';
import 'package:history_logging_app/pages/typelist.dart';
import 'package:intl/intl.dart';

import 'colours.dart';

List<Record> records = [];

void recordsAdd(type) {
  records.add(Record(type, DateTime.now()));
}

void recordsClear() {
  records.clear();
}

List<RecordType> types = [];

void typesAdd(title, author, description, List<String> lines) {
  types.add(RecordType(title, author, description, DateTime.now(), lines));
}

void typesRemove(removedType) {
  types.removeWhere((type) => type == removedType);
}

void typesUpdateList() {
  typeListStateNotifier.value = !typeListStateNotifier.value;
}

List<Widget> getTypeWidgets(BuildContext context, String typeContainer) {
  List<Widget> recordTypes = [];

  if (types.isNotEmpty) {
    for (int x = 0; x <= types.length - 1; x++) {
      if (typeContainer == "tAddContainer") {
        recordTypes.add(tAddContainer(context, types[x]));
      } else if (typeContainer == "tTypeContainer") {
        recordTypes.add(tTypeContainer(context, types[x]));
      }
    }
  }
  return recordTypes;
}

List<Widget> getRecordWidgets(BuildContext context) {
  List<Widget> recordsWidgets = [];

  recordsWidgets.add(
    const SizedBox(
      height: 20,
    ),
  );

  if (records.isNotEmpty) {
    for (int x = 0; x <= records.length - 1; x++) {
      recordsWidgets.add(recordContainer(context, records[x]));
    }
  }
  return recordsWidgets;
}

Widget tAddContainer(BuildContext context, RecordType currentType) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Column(
    children: [
      InkWell(
      onTap: () {
        recordsAdd(currentType);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Adding record...'),
          ),
        );
      },
          child: Container(
              height: 125,
              width: screenWidth * 0.9,
              decoration: const BoxDecoration(
                  color: HistColours.cHighlight,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
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
                            const TextSpan(
                              text: 'Type: ',
                              style: TextStyle(
                                color: HistColours.cBack,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: currentType.getTitle(),
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
                          currentType.getAuthor() +
                              ", " +
                              currentType.getCreationDT(),
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
                              const TextSpan(
                                text: 'Description: ',
                                style: TextStyle(
                                  color: HistColours.cBack,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: currentType.getDesc(),
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
              ))),
      const SizedBox(
        height: 20,
      )
    ],
  );
}

Widget tTypeContainer(BuildContext context, RecordType currentType) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
      height: 190,
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
          const SizedBox(height: 45),
          Row(
            children: [
              const SizedBox(width: 15),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(text: 'Format: ',
                        style: TextStyle(
                          color: HistColours.cBack,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(text: currentType.getFormat(),
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

Widget recordContainer(BuildContext context, Record currentRecord) {
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
                              TextSpan(
                                text: currentRecord.type.author + " "
                                    + currentRecord.type.lines[0] + " "
                                    + DateFormat('kk:mm (yyyy-MM-dd)')
                                    .format(currentRecord.type.creationDateTime),
                                style: const TextStyle(
                                  color: HistColours.cHighlight,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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