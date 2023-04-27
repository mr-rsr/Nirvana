import 'package:flutter/material.dart';
import 'package:nirvana/src/res/colors.dart';

const normalStyle = TextStyle(
  fontSize: 14,
);

const titleStyle = TextStyle(
  fontSize: 35,
);

const boldStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const errorStyle = TextStyle(
  fontSize: 14,
  color: Colors.red,
);

var smallHintStyle = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w600,
  color: Colors.grey.shade400,
);
var textTheme = const TextTheme();
final darkTheme = ThemeData(
  primaryColor: darkPrimaryColor,
  brightness: Brightness.dark,
  textTheme: textTheme.apply(
    bodyColor: darkTextColor,
    displayColor: darkTextColor,
  ),
);

final lightTheme = ThemeData(
  primaryColor: lightPrimaryColor,
  brightness: Brightness.light,
  textTheme: textTheme.apply(
    bodyColor: lightTextColor,
    displayColor: lightTextColor,
  ),
);
