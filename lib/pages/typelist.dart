
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/pages/typeadd.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import 'package:history_logging_app/classes/histglobals.dart' as globals;

final ValueNotifier<bool> typeListStateNotifier = ValueNotifier(false);

class HistoryTypeList extends StatefulWidget {
  const HistoryTypeList ({Key? key}) : super(key: key);

  @override
  State<HistoryTypeList> createState() => _HistoryTypeListState();
}

class _HistoryTypeListState extends State<HistoryTypeList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: typeListStateNotifier,
        builder: (_, homeState, __) {
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
                          children: globals.getTypeWidgets(
                              context, "tTypeContainer"),
                        )
                    )
                )
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HistoryTypeAdd()));
              },
              heroTag: "btnadd",
              tooltip: 'Add Type',
              backgroundColor: HistColours.cHighlight,
              child: const Icon(Icons.add),
            ),
          );
        }
    );
  }
}