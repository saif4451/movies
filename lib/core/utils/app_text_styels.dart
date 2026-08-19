// core/utils/app_text_styels.dart
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class AppTextStyels {
  static ThemeData getThemeData() => ThemeData(
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

}
