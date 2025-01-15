import 'package:flutter/material.dart';
import 'package:widgets_and_more/res/color_app.dart';

ThemeData theme = ThemeData(
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: ColorApp.primary,
    indicatorColor: Colors.green.shade100,
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

ThemeData themeDark = ThemeData(
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.black,
    labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
    indicatorColor: Colors.grey,
  ),
);
