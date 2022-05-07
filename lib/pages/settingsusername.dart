
import 'package:flutter/material.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import '../shared/globals.dart' as globals;

class HistorySettingsUsername extends StatefulWidget {
  const HistorySettingsUsername ({Key? key,}) : super(key: key);

  @override
  State<HistorySettingsUsername> createState() => _HistorySettingsUsernameState();
}

class _HistorySettingsUsernameState extends State<HistorySettingsUsername> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameInput = TextEditingController();

  late String username = "";

  TextStyle formTextStyle = TextStyle(
    fontSize: 18,
    color: HistColours.cText,
    fontWeight: FontWeight.w900,
  );

  InputDecoration getFormDecoration(String label) {
    return InputDecoration(
        hintText: globals.getUsername(),
        focusColor: HistColours.cText,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HistColours.cHighlight),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HistColours.cText),
        ),
    );
  }

  validateField(value, String warning) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HistColours.cBack,
      appBar: secondaryAppbar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
         Container(
          padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: usernameInput,
                      cursorColor: HistColours.cText,
                      style: formTextStyle,
                      decoration: getFormDecoration(
                          "Username",),
                      validator: (value) {
                        username = value!;
                        return validateField(value, 'Please enter a username.');
                      },
                    ),

                    Container(
                      width: screenWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(context);
                                globals.setUsername(usernameInput.text);
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              backgroundColor: HistColours.cHighlight,
                              elevation: 1,
                              fixedSize: const Size.fromHeight(47),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                            ),
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                color: HistColours.cBackLight,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.only(top: 20.0),
                    )
                  ],
                ))),
        ],
      ),
    );
  }
}