
import 'package:flutter/material.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import '../shared/globals.dart' as globals;

class HistoryTypeAdd extends StatefulWidget {
  const HistoryTypeAdd ({Key? key}) : super(key: key);

  @override
  State<HistoryTypeAdd> createState() => _HistoryTypeAddState();
}

class _HistoryTypeAddState extends State<HistoryTypeAdd> {

  final _formKey = GlobalKey<FormState>();

  late String typeName = "";
  late String typeString = "";
  late String typeDescription = "";

  TextStyle formTextStyle = const TextStyle(
    fontSize: 18,
    color: HistColours.cForward,
    fontWeight: FontWeight.w900,
  );

  InputDecoration getFormDecoration(String label) {
    return InputDecoration(
        focusColor: HistColours.cHighlight,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HistColours.cHighlight),
        )
    );
  }

  validateField(value, String warning) {
    if (value == null || value.isEmpty) {
      return 'Please enter the type name.';
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
                      cursorColor: HistColours.cHighlight,

                      style: formTextStyle,
                      decoration: getFormDecoration("Type Name"),
                      validator: (value) {
                        typeName = value!;
                        return validateField(value, 'Please enter the type name.');
                      },
                    ),

                    TextFormField(
                      cursorColor: HistColours.cHighlight,
                      maxLines: 2,

                      style: formTextStyle,
                      decoration: getFormDecoration("Record String"),
                      validator: (value) {
                        typeString = value!;
                        return validateField(value, 'Please enter the record string.');
                      },
                    ),

                    TextFormField(
                      cursorColor: HistColours.cHighlight,
                      maxLines: 3,

                      style: formTextStyle,
                      decoration: getFormDecoration("Type Description"),
                      validator: (value) {
                        typeDescription = value!;
                        return validateField(value, 'Please enter the type description.');
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
                                globals.typesAdd(typeName, "Current User", typeDescription, [typeString]);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Adding record type...'),
                                  ),
                                );
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
                                color: HistColours.cBack,
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