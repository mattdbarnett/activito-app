
import 'package:flutter/material.dart';
import 'package:history_logging_app/main.dart';
import 'package:history_logging_app/pages/settingscolours.dart';
import 'package:page_transition/page_transition.dart';
import '../shared/cleardialog.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import 'package:settings_ui/settings_ui.dart';
import '../shared/globals.dart' as globals;

final ValueNotifier<bool> settingsStateNotifier = ValueNotifier(false);

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
    return ValueListenableBuilder<bool>(
        valueListenable: settingsStateNotifier,
        builder: (_, settingsState, __)
    {
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
                      leading: Icon(
                          Icons.delete, color: HistColours.cHighlight),
                      title: Text('Clear', style: settingsFontStyle),
                      onPressed: (BuildContext context) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return clearDialog(context,
                                  "Are you sure you want to clear all content?",
                                  "clearAll");
                            });
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                          Icons.color_lens, color: HistColours.cHighlight),
                      title: Text('Colours', style: settingsFontStyle),
                      onPressed: (BuildContext context) {
                        Navigator.push(context,
                            PageTransition(
                                childCurrent: const HistorySettings(),
                                child: const HistorySettingsColours(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(
                          Icons.dark_mode, color: HistColours.cHighlight),
                      title: Text('Dark Theme', style: settingsFontStyle),
                      initialValue: globals.getDarkMode(),
                      activeSwitchColor: HistColours.cHighlight,
                      onToggle: (bool value) {
                        globals.toggleDarkMode();

                        if(globals.getDarkMode()) {
                          themeNotifier.value = ThemeMode.dark;
                        } else {
                          themeNotifier.value = ThemeMode.light;
                        }

                        value = globals.getDarkMode();
                        setState(() {});
                      },
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(
                          Icons.developer_mode, color: HistColours.cHighlight),
                      title: Text('Developer Mode', style: settingsFontStyle),
                      initialValue: globals.getDevMode(),
                      activeSwitchColor: HistColours.cHighlight,
                      onToggle: (bool value) {
                        globals.toggleDevMode();
                        globals.homeUpdate();
                        setState(() {});
                      },
                    ),
                    SettingsTile.switchTile(
                      leading: Icon(Icons.note_add_outlined,
                          color: HistColours.cHighlight),
                      title: Text('New Types', style: settingsFontStyle),
                      initialValue: globals.getNewTypes(),
                      activeSwitchColor: HistColours.cHighlight,
                      onToggle: (bool value) {
                        globals.toggleNewTypes();
                        setState(() {});
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                          Icons.drive_file_rename_outline, color: HistColours.cHighlight),
                      title: Text('Username', style: settingsFontStyle),
                      onPressed: (BuildContext context) {
                        Navigator.push(context,
                            PageTransition(
                                childCurrent: const HistorySettings(),
                                child: const HistorySettingsColours(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                          Icons.help_sharp, color: HistColours.cHighlight),
                      title: Text('About', style: settingsFontStyle),
                      onPressed: (BuildContext context) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("About",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: HistColours.cText,
                                  ),
                                ),
                                content: const Text("Hi! I'm Matt! I'm a "
                                    "software developer from Huddersfield "
                                    "currently living in Cardiff :). I made "
                                    "this app to improve my experience using "
                                    "Flutter and to help track my eating "
                                    "habits."),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton
                                          .styleFrom(
                                        primary:
                                        HistColours.cHighlight,
                                      ),
                                      child: const Text('Close',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      )
                                  ),
                                ],
                              );
                            }
                        );
                      },
                    ),
                  ],
                ),
              ]
          )
      );
    });
  }
}