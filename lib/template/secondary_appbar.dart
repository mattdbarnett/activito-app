
import 'package:flutter/material.dart';
import '../classes/colours.dart';

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

FloatingActionButton appbarBack(BuildContext context) {
  return FloatingActionButton(
    elevation: 1,
    highlightElevation: 3,
    backgroundColor: HistColours.cHighlight,
    key: const Key('DrawerButton'),
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: const Icon(Icons.arrow_back),
  );
}