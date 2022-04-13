
import 'package:flutter/material.dart';
import 'package:history_logging_app/classes/colours.dart';
import 'package:history_logging_app/template/secondary_appbar.dart';

class HistoryTypeAdd extends StatefulWidget {
  const HistoryTypeAdd ({Key? key}) : super(key: key);

  @override
  State<HistoryTypeAdd> createState() => _HistoryTypeAddState();
}

class _HistoryTypeAddState extends State<HistoryTypeAdd> {

  final _formKey = GlobalKey<FormState>();

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
                  style: const TextStyle(
                    fontSize: 18,
                    color: HistColours.cForward,
                    fontWeight: FontWeight.w900,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the type name.';
                    } else {
                      //name = value;
                    }
                    return null;
                  },
                  cursorColor: HistColours.cHighlight,
                  decoration: const InputDecoration(
                    focusColor: HistColours.cHighlight,
                    labelText: 'Type Name',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w900,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: HistColours.cHighlight),
                    )
                  ),
                ),
                Container(
                  width: screenWidth,
                  child: ElevatedButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: HistColours.cBack,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Adding record type...'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: HistColours.cHighlight
                    )
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