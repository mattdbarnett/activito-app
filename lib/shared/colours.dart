import 'package:flutter/material.dart';
import '../shared/globals.dart' as globals;

class HistColours {

  static const Color cRed = Color(0xFFDB5461);
  static const Color cOrange = Color(0xFFF49D3F);
  static const Color cYellow = Color(0xFFE5BF57);
  static const Color cPlains = Color(0xFF6D9F71);
  static const Color cGreen = Color(0xFF44AF69);
  static const Color cForest = Color(0xFF307351);
  static const Color cNavy = Color(0xFF2E86AB);
  static const Color cPurple = Color(0xFF585191);
  static const Color cSpace = Color(0xFF2E2D4D);
  static const Color cOlive = Color(0xFF4C4C4C);
  static const Color cDarkGrey = Color(0xFF6B6B63);
  static const Color cGrey = Color(0xFF919187);

  static var colourList = <Color>[
    cRed, cOrange, cYellow,
    cPlains, cGreen, cForest,
    cNavy, cPurple, cSpace,
    cOlive, cDarkGrey, cGrey,
  ];

  static Color cHighlight = cRed;
  static Color cInactive = cGrey;
  static int cHIndex = 0;

  static void setCurrentColour(Color newColour, int index) {
    cHighlight = newColour;
    cHIndex = index;
  }

  static const Color cBackLight = Color(0xFFD8DAD6);
  static const Color cBackDark = Color(0xFF353531);
  static Color cBack = cBackLight;
  static Color cText = cBackDark;

  static void setBackground() {
    if(globals.getDarkMode()) {
      cBack = cBackDark;
      cText = cBackLight;
    } else {
      cBack = cBackLight;
      cText = cBackDark;
    }
    globals.settingsUpdate();
  }

  static const Color cForward = Color(0xFF686963);

}