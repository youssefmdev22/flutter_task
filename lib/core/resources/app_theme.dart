import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        labelMedium: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.blueColor),
      ));
}
