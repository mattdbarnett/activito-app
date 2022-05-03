
import 'package:flutter/material.dart';

import '../shared/colours.dart';
import '../template/secondary_appbar.dart';

class HistorySettingsColours extends StatefulWidget {
  const HistorySettingsColours({Key? key}) : super(key: key);

  @override
  State<HistorySettingsColours> createState() => _HistorySettingsColoursState();
}

class _HistorySettingsColoursState extends State<HistorySettingsColours> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HistColours.cBack,
      appBar: secondaryAppbar(context),
      body: GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 3),
          ),
          itemBuilder: (BuildContext context, int index) {
            return const Text("Test");
          }
      ),
    );
  }
}