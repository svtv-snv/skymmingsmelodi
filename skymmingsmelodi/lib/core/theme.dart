import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.text),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.text),
  ),
);