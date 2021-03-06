
import 'package:flutter/material.dart';
import 'package:history_logging_app/pages/settings.dart';
import 'package:page_transition/page_transition.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/pages/recordadd.dart';
import 'package:history_logging_app/pages/recordlist.dart';
import 'package:history_logging_app/pages/typelist.dart';
import '../shared/globals.dart' as globals;
import '../shared/devcontent.dart' as content;

final ValueNotifier<bool> homeStateNotifier = ValueNotifier(false);

class HistoryHome extends StatefulWidget {
  const HistoryHome ({Key? key}) : super(key: key);

  @override
  State<HistoryHome> createState() => _HistoryHomeState();
}

class _HistoryHomeState extends State<HistoryHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder<bool>(
        valueListenable: homeStateNotifier,
        builder: (_, homeState, __)
    {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HistColours.cBack,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.3,
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 50
                      ,
                    ),
                    child: Text(
                      content.getCurrentContent()["home_title"].toString(),
                      style: TextStyle(
                        color: HistColours.cHighlight,
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                      ),
                    )
                  ),
                ),

                const Divider(
                  thickness: 3,
                  color: HistColours.cForward,
                ),

                const Divider(
                  thickness: 2,
                  color: HistColours.cForward,
                  indent: 20,
                  endIndent: 20,
                ),
              ]
            ),
          ),
          Container(
            height: screenHeight * 0.6,
            width: screenWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(45)),
            ),
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  menuButton(context,
                      content.getCurrentContent()["home_view"].toString(),
                      screenWidth,
                      const HistoryList()),
                  const SizedBox(height: 30),
                  menuButton(context,
                      content.getCurrentContent()["home_add_records"].toString(),
                      screenWidth,
                      const HistoryAddRecord()),
                  const SizedBox(height: 30),
                  newTypesCheck(context,
                      screenWidth,
                      content.getCurrentContent()["home_add_types"].toString()),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: HistColours.cHighlight,
                          elevation: 2,
                          fixedSize: const Size.fromRadius(40),
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              PageTransition(
                                  childCurrent: const HistoryHome(),
                                  child: const HistorySettings(),
                                  type: PageTransitionType.rightToLeftWithFade));
                        },
                        child: const Icon(
                          Icons.settings,
                          size: 40,
                          color: HistColours.cBackLight,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ),
          Container(
            height: screenHeight * 0.1,
          ),
        ],
      ),
    );
  });
  }
}

Widget newTypesCheck(BuildContext context, double screenWidth, String title) {
  if(globals.getNewTypes()) {
    return menuButton(context, title, screenWidth, const HistoryTypeList());
  } else {
    return const Spacer();
  }
}

TextButton menuButton(BuildContext context, String titleText, double screenWidth, var newPage) {
  return TextButton(
    onPressed: () {
      Navigator.push(context,
          PageTransition(
              childCurrent: const HistoryHome(),
              child: newPage,
              type: PageTransitionType.rightToLeftWithFade));
    },
    child: Text(
      titleText,
      style: const TextStyle(
        color: HistColours.cBackLight,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
    ),
    style: TextButton.styleFrom(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      backgroundColor: HistColours.cHighlight,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)),
    ),
  );
}