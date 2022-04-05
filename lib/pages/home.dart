
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
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            color: HistColours.cBack,
            height: screenHeight * 0.3,
            child: Row(
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
                const Spacer(),
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
          ),
          Container(
            color:  HistColours.cBack,
            height: screenHeight * 0.6,
          ),
          Container(
            color: HistColours.cBack,
            height: screenHeight * 0.1,
          ),
        ],
      ),
    );
  }
}