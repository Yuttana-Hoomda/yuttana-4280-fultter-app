import 'package:flutter/material.dart';

class Responsive {
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}