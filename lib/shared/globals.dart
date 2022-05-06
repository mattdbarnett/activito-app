
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/record.dart';
import 'package:history_logging_app/classes/recordtype.dart';
import 'package:history_logging_app/pages/home.dart';
import 'package:history_logging_app/pages/settings.dart';
import 'package:history_logging_app/pages/typelist.dart';
import '../pages/recordadd.dart';
import '../shared/devcontent.dart' as content;

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

bool devMode = false;

bool getDevMode() {
  return devMode;
}

void toggleDevMode() {
  devMode = !devMode;
  content.setCurrentContent(devMode);
}

String username = "Current User";

String getUsername() {
  return username;
}

void setUsername(String input) {
  username = input;
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