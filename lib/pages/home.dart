
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';

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
    return Scaffold(
      backgroundColor: HistColours.cBack,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.3,
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: const Center(
              child: Text("History Logging"),
            )
          ),
          Container(
            height: screenHeight * 0.6,
            width: screenWidth,
            decoration: const BoxDecoration(
              color: HistColours.cForward,
              borderRadius: BorderRadius.all(Radius.circular(45)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                  spreadRadius: 0.0,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  menuButton("View List", screenWidth),
                  const SizedBox(height: 30),
                  menuButton("Add Records", screenWidth),
                  const SizedBox(height: 30),
                  menuButton("Add Types", screenWidth),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: HistColours.cHighlight,
                          elevation: 5,
                          fixedSize: const Size.fromRadius(40),
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.settings,
                          size: 40,
                          color: HistColours.cText,
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
  }
}

TextButton menuButton(String titleText, double screenWidth) {
  return TextButton(
    onPressed: () {  },
    child: Text(
      titleText,
      style: const TextStyle(
        color: HistColours.cBack,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
    ),
    style: TextButton.styleFrom(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 30,
        right: 30,
      ),
      backgroundColor: HistColours.cHighlight,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)),
    ),
  );
}