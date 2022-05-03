import 'package:flutter/material.dart';
import 'package:history_logging_app/shared/histglobals.dart';
import '../shared/colours.dart';
import '../shared/histglobals.dart' as globals;

AlertDialog clearDialog(BuildContext context,
    String dialogText,
    String clearFunctionStr,
    [var clearItem]) {

  TextStyle fontStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  );

  void getClearFunction() {
    switch(clearFunctionStr) {
      case "recordsClear": {
        globals.recordsClear();
        break;
      }
      case "typesClear": {
        globals.typesClear();
        break;
      }
      case "recordRemove": {
        //placeholder
        break;
      }
      case "typeRemove": {
        globals.typesRemove(clearItem);
        break;
      }
      case "clearAll": {
        globals.clearAll();
        break;
      }
    }
  }

  return AlertDialog(
      title:
      const Text("Clear",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      content: Text(dialogText, style: fontStyle),
      actions: [
        ElevatedButton(
            onPressed: () {
              getClearFunction();

              pagesUpdate();

              Navigator.pop(context);
            },
            style: ElevatedButton
                .styleFrom(
              primary: HistColours.cHighlight,
            ),
            child: Text('Yes', style: fontStyle)
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton
                .styleFrom(
              primary:
              HistColours.cHighlight,
            ),
            child: Text('Cancel', style: fontStyle)
        ),
      ]);

}