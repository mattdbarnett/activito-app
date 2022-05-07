
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:share_plus/share_plus.dart';
import '../classes/recordtype.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import '../shared/globals.dart' as globals;

class HistoryAddRecord extends StatefulWidget {
  const HistoryAddRecord ({Key? key}) : super(key: key);

  @override
  State<HistoryAddRecord> createState() => _HistoryAddRecordState();
}

class _HistoryAddRecordState extends State<HistoryAddRecord> {
  @override
  Widget build(BuildContext context) {
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
              children: globals.getTypeWidgets(context, "tAddContainer"),
            )
          )
        )
      ),
    );
  }
}

// This type container is for the "Add Records" page
Widget tAddContainer(BuildContext context, RecordType currentType) {
  double screenWidth = MediaQuery.of(context).size.width;

  SizedBox content = SizedBox(
    height: 125,
    width: screenWidth * 0.84,
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
            extentRatio: 0.45,
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  globals.recordsAdd(currentType);
                },
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                icon: Icons.add,
                label: 'Add',
              ),
              SlidableAction(
                onPressed: (BuildContext context) {
                  Share.share("I just " +
                      currentType.lines[0].toString() +
                      " right now! :)");
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
                height: 60,
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