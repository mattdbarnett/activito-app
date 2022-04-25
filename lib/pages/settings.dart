
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

  TextStyle settingsFontStyle = const TextStyle(
    fontFamily: "Manrope",
  );

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
              SettingsTile(
                leading: const Icon(Icons.delete, color: HistColours.cHighlight),
                title: Text('Clear', style: settingsFontStyle),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.color_lens, color: HistColours.cHighlight),
                title: Text('Colours', style: settingsFontStyle),
                value: Text(HistColours.cHighlight.toString()),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                leading: const Icon(Icons.developer_mode, color: HistColours.cHighlight),
                title: Text('Developer Mode', style: settingsFontStyle),
                initialValue: false,
                activeSwitchColor: HistColours.cHighlight,
                onToggle: (bool value) {  },
              ),
              SettingsTile.switchTile(
                leading: const Icon(Icons.note_add_outlined, color: HistColours.cHighlight),
                title: Text('New Types', style: settingsFontStyle),
                initialValue: true,
                activeSwitchColor: HistColours.cHighlight,
                onToggle: (bool value) {  },
              ),
              SettingsTile.switchTile(
                leading: const Icon(Icons.dark_mode, color: HistColours.cHighlight),
                title: Text('Dark Theme', style: settingsFontStyle),
                initialValue: false,
                activeSwitchColor: HistColours.cHighlight,
                onToggle: (bool value) {  },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.help_sharp, color: HistColours.cHighlight),
                title: Text('About', style: settingsFontStyle),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ]
      )
    );
  }
}