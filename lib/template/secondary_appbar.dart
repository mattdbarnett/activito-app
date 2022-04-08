
import 'package:flutter/material.dart';
import '../classes/colours.dart';

AppBar secondaryAppbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: HistColours.cForward,
    leading: Transform.scale(
      scale: 0.7,
      child: FloatingActionButton(
        backgroundColor: HistColours.cHighlight,
        key: const Key('DrawerButton'),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    ),
  );
}