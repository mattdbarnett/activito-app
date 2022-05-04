
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:history_logging_app/classes/record.dart';
import 'package:history_logging_app/classes/recordtype.dart';
import 'package:history_logging_app/pages/home.dart';
import 'package:history_logging_app/pages/settings.dart';
import 'package:history_logging_app/pages/typelist.dart';
import 'package:history_logging_app/shared/cleardialog.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../pages/recordlist.dart';
import 'colours.dart';


// -- Records 

List<Record> records = [];

void recordsAdd(type) {
  records.add(Record(type, DateTime.now()));
}

void recordsClear() {
  records.clear();
}

// -- Types

List<RecordType> types = [];

void typesAdd(title, author, description, List<String> lines) {
  types.add(RecordType(title, author, description, DateTime.now(), lines));
  typesUpdateList();
}

void typesRemove(removedType) {
  types.removeWhere((type) => type == removedType);
}

void typesClear() {
  types.clear();
}

// -- Page Updaters

void typesUpdateList() {
  typeListStateNotifier.value = !typeListStateNotifier.value;
}

void recordsUpdateList() {
  recordListStateNotifier.value = !recordListStateNotifier.value;
}

void homeUpdate() {
  homeStateNotifier.value = !homeStateNotifier.value;
}

void settingsUpdate() {
  settingsStateNotifier.value = !settingsStateNotifier.value;
}

void pagesUpdate() {
  typesUpdateList();
  recordsUpdateList();
}

void clearAll() {
  recordsClear();
  typesClear();
}

// -- Settings

bool newTypes = true;

bool getNewTypes() {
  return newTypes;
}

void setNewTypes(bool value) {
  newTypes = value;
}

void toggleNewTypes() {
  newTypes = !newTypes;
}

bool darkMode = false;

bool getDarkMode() {
  return darkMode;
}

void toggleDarkMode() {
  darkMode = !darkMode;
  HistColours.setBackground();
}

// -- Widget Lists

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
    SizedBox(
      width: MediaQuery.of(context).size.width,
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

// -- Widgets

// This type container is for the "Add Records" page
Widget tAddContainer(BuildContext context, RecordType currentType) {
  double screenWidth = MediaQuery.of(context).size.width;

  SizedBox content = SizedBox(
      height: 125,
      width: screenWidth * 0.84,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: 'Type: ',
                  style: TextStyle(
                    color: HistColours.cBackLight,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: currentType.getTitle(),
                  style: const TextStyle(
                    color: HistColours.cBackLight,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              currentType.getAuthor() + ", " + currentType.getCreationDT(),
              style: const TextStyle(
                color: HistColours.cBackLight,
                fontWeight: FontWeight.w900,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: 'Description: ',
                  style: TextStyle(
                    color: HistColours.cBackLight,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: currentType.getDesc(),
                  style: const TextStyle(
                    color: HistColours.cBackLight,
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
  );

  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
        color: HistColours.cHighlight,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            extentRatio: 0.45,
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  recordsAdd(currentType);
                },
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                icon: Icons.add,
                label: 'Add',
              ),
              SlidableAction(
                onPressed: (BuildContext context) {
                  Share.share("I just " +
                      currentType.lines[0].toString() +
                      " right now! :)");
                },
                autoClose: false,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: HistColours.cBackLight,
                ),
                width: screenWidth * 0.01,
                height: 60,
              ),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              content,
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}

// This type container is for the "Record Types" page
Widget tTypeContainer(BuildContext context, RecordType currentType) {
  double screenWidth = MediaQuery.of(context).size.width;

  Container content = Container(
      height: 190,
      width: screenWidth * 0.84,
      margin: const EdgeInsets.only(
          bottom: 20
      ),
      decoration: BoxDecoration(
          color: HistColours.cHighlight,
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: 'Type: ',
                  style: TextStyle(
                    color: HistColours.cBackLight,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: currentType.getTitle(),
                  style: const TextStyle(
                    color: HistColours.cBackLight,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              currentType.getAuthor() + ", " + currentType.getCreationDT(),
              style: const TextStyle(
                color: HistColours.cBackLight,
                fontWeight: FontWeight.w900,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Description: ',
                    style: TextStyle(
                      color: HistColours.cBackLight,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: currentType.getDesc(),
                    style: const TextStyle(
                      color: HistColours.cBackLight,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 45),
          Flexible(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Format: ',
                    style: TextStyle(
                      color: HistColours.cBackLight,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: currentType.getFormat(),
                    style: const TextStyle(
                      color: HistColours.cBackLight,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
  );

  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            color: HistColours.cHighlight,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            extentRatio: 0.65,
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return clearDialog(context,
                            "Are you sure you want to delete this event type?",
                            "typeRemove",
                            currentType,
                        );
                      });
                },
                autoClose: false,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (BuildContext context) {},
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (BuildContext context) {
                  Share.share("I have a new activity type! It's called " +
                      currentType.title +
                      "! :)");
                },
                autoClose: false,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: HistColours.cBackLight,
                ),
                width: screenWidth * 0.01,
                height: 80,
              ),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              content,
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ],
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
                                    + currentRecord.type.lines[0] + " at "
                                    + DateFormat('kk:mm (yyyy-MM-dd)')
                                    .format(currentRecord.dateTime),
                                style: TextStyle(
                                  color: HistColours.cText,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                ),
                              ),
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