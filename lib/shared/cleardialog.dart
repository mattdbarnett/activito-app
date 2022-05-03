import 'package:flutter/material.dart';
import 'package:history_logging_app/shared/histglobals.dart';
import '../shared/colours.dart';

AlertDialog clearDialog(BuildContext context,
    String dialogText,
    void clearFunction) {

  TextStyle fontStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  );

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
              clearFunction;

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