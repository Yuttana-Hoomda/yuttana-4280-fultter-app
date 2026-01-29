import 'package:flutter/material.dart';

class Responsive {
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 650 &&
        MediaQuery.of(context).size.width < 1100;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }
}
