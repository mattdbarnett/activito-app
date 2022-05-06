
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import '../classes/recordtype.dart';
import '../shared/cleardialog.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/pages/typeadd.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import '../shared/globals.dart' as globals;

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
                            "typesClear");
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
                    color: HistColours.cBackLight,
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
                Navigator.push(context,
                    PageTransition(
                        childCurrent: const HistoryTypeList(),
                        child: const HistoryTypeAdd(editMode: false),
                        type: PageTransitionType.rightToLeftWithFade));
              },
              heroTag: "btnadd",
              tooltip: 'Add Type',
              backgroundColor: HistColours.cHighlight,
              child: const Icon(Icons.add, color:  HistColours.cBackLight),
            ),
          );
        }
    );
  }
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
                onPressed: (BuildContext context) {
                  Navigator.push(context,
                      PageTransition(
                          childCurrent: const HistoryTypeList(),
                          child: HistoryTypeAdd(editMode: true, recordType: currentType),
                          type: PageTransitionType.rightToLeftWithFade));
                },
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