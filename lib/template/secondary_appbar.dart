
import 'package:flutter/material.dart';
import '../classes/colours.dart';

AppBar secondaryAppbar(BuildContext context) {
  return AppBar(
    toolbarHeight: 60,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Transform.scale(
      scale: 0.7,
      child: FloatingActionButton(
        elevation: 1,
        highlightElevation: 3,
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