
import 'package:flutter/material.dart';

import '../shared/colours.dart';
import '../template/secondary_appbar.dart';
import '../shared/globals.dart' as globals;

class HistorySettingsColours extends StatefulWidget {
  const HistorySettingsColours({Key? key}) : super(key: key);

  @override
  State<HistorySettingsColours> createState() => _HistorySettingsColoursState();
}

class _HistorySettingsColoursState extends State<HistorySettingsColours> {

  Color getCardColour(int index) {
    return HistColours.colourList[index];
  }

  Widget getIconSelect(int index) {
    if(index == HistColours.cHIndex) {
      return const Center(
          child: Icon(
            Icons.done,
            color: HistColours.cBack,
          )
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HistColours.cBack,
      appBar: secondaryAppbar(context),
      body: GridView.builder(
          shrinkWrap: true,
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 3),
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                HistColours.setCurrentColour(
                    HistColours.colourList[index],
                    index
                );
                globals.settingsUpdate();
                setState(() {});
              },
              child: Card(
                  color: getCardColour(index),
                  child: getIconSelect(index),
              ),
            );
          }
      ),
    );
  }
}