
import 'package:flutter/material.dart';
import '../shared/cleardialog.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/pages/typeadd.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import '../shared/histglobals.dart' as globals;

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
            appBar: secondaryAppbar(context,
            [
              const Spacer(),
              TextButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return clearDialog(context,
                            "Are you sure you want to clear all types?",
                            globals.typesClear());
                      }),
                },
                style: TextButton.styleFrom(
                  backgroundColor: HistColours.cHighlight,
                  elevation: 1,
                  fixedSize: const Size.fromHeight(47),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                ),
                child: const Text(
                  "Clear",
                  style: TextStyle(
                    color: HistColours.cBack,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ]),
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
              child: const Icon(Icons.add, color:  HistColours.cBack),
            ),
          );
        }
    );
  }
}