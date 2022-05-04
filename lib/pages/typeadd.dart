
import 'package:flutter/material.dart';
import '../classes/recordtype.dart';
import '../shared/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';
import '../shared/globals.dart' as globals;


class HistoryTypeAdd extends StatefulWidget {
  final RecordType? recordType;
  final bool editMode;

  const HistoryTypeAdd ({Key? key,
    required this.editMode,
    this.recordType }) : super(key: key);


  @override
  State<HistoryTypeAdd> createState() => _HistoryTypeAddState();
}

class _HistoryTypeAddState extends State<HistoryTypeAdd> {

  final _formKey = GlobalKey<FormState>();

  late String typeName = "";
  late String typeString = "";
  late String typeDescription = "";

  TextStyle formTextStyle = TextStyle(
    fontSize: 18,
    color: HistColours.cText,
    fontWeight: FontWeight.normal,
  );

  RecordType? getType() {
    if(widget.editMode) {
      return widget.recordType;
    } else {
      return RecordType("", "", "", DateTime.now(), [""]);
    }
  }

  String editCheck(String oldStr, String newStr) {
    if(newStr.isEmpty) {
      return oldStr;
    } else {
      return newStr;
    }
  }

  InputDecoration getFormDecoration(String label, [String hintText = ""]) {
    return InputDecoration(
        focusColor: HistColours.cText,
        hintText: hintText,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HistColours.cHighlight, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HistColours.cInactive, width: 2),
        ),
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
                      cursorColor: HistColours.cText,
                      keyboardType: TextInputType.visiblePassword,

                      style: formTextStyle,
                      decoration: getFormDecoration(
                          "Type Name",
                          getType()?.title ?? ""
                      ),
                      validator: (value) {
                        typeName = value!;
                        return validateField(value, 'Please enter the type name.');
                      },
                    ),

                    TextFormField(
                      cursorColor: HistColours.cText,
                      maxLines: 2,
                      keyboardType: TextInputType.visiblePassword,

                      style: formTextStyle,
                      decoration: getFormDecoration(
                          "Record String",
                          getType()?.lines[0] ?? ""
                      ),
                      validator: (value) {
                        typeString = value!;
                        return validateField(value, 'Please enter the record string.');
                      },
                    ),

                    TextFormField(
                      cursorColor: HistColours.cText,
                      maxLines: 3,
                      keyboardType: TextInputType.visiblePassword,

                      style: formTextStyle,
                      decoration: getFormDecoration(
                          "Type Description",
                          getType()?.description ?? ""
                      ),
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
                                if(!widget.editMode) {
                                  globals.typesAdd(typeName,
                                      globals.getUsername(),
                                      typeDescription,
                                      [typeString]
                                  );
                                  Navigator.of(context).pop();
                                }
                              }
                              if(widget.editMode) {
                                String editName = editCheck(
                                    widget.recordType?.title ?? "",
                                    typeName);
                                String editDesc = editCheck(
                                    widget.recordType?.description ?? "",
                                    typeDescription);
                                String editString = editCheck(
                                    widget.recordType?.lines[0] ?? "",
                                    typeString);
                                globals.typesEdit(
                                    widget.recordType ?? RecordType(
                                        "ERROR", "ERROR", "ERROR", DateTime.now(), [""]),
                                    [editName, editDesc, editString]);
                                Navigator.of(context).pop();
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