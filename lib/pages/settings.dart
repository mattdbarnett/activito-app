
import 'package:flutter/material.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import 'package:settings_ui/settings_ui.dart';

class HistorySettings extends StatefulWidget {
  const HistorySettings ({Key? key}) : super(key: key);

  @override
  State<HistorySettings> createState() => _HistorySettingsState();
}

class _HistorySettingsState extends State<HistorySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HistColours.cBack,
      appBar: secondaryAppbar(context),
      body: SettingsList(
        darkTheme: const SettingsThemeData(
          settingsListBackground: Colors.transparent,
        ),
        lightTheme: const SettingsThemeData(
          settingsListBackground: Colors.transparent,
        ),
        sections: [
          SettingsSection(
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.home, color: HistColours.cHighlight),
                title: const Text('Example 1'),
                value: const Text('Example 1'),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.home, color: HistColours.cHighlight),
                title: const Text('Example 2'),
                value: const Text('Example 2'),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.home, color: HistColours.cHighlight),
                title: const Text('Example 3'),
                value: const Text('Example 3'),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ]
      )
    );
  }
}