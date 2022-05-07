
import 'package:flutter/material.dart';
import '../shared/colours.dart';
import '../shared/globals.dart' as globals;

AppBar secondaryAppbar(BuildContext context, [List<Widget> inputActions = const []]) {

  List<Widget> outputActions = [];
  outputActions.add(const SizedBox(width: 4));
  outputActions.add(appbarBack(context));
  outputActions.addAll(inputActions);
  outputActions.add(const SizedBox(width: 4));

  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 60,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: outputActions,
    )
  );
}

SizedBox appbarBack(BuildContext context) {
  return SizedBox(
    width: 47,
    height: 47,
    child: FloatingActionButton(
      heroTag: "btnback",
      tooltip: 'Back',
      elevation: 1,
      highlightElevation: 1 ,
      backgroundColor: HistColours.cHighlight,
      key: const Key('DrawerButton'),
      onPressed: () {
        globals.homeUpdate();
        Navigator.of(context).pop();
      },
      child: const Icon(Icons.arrow_back, color: HistColours.cBackLight),
    )
  );
}