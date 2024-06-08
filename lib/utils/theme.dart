import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appLightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    tabBarTheme: const TabBarTheme(
      labelPadding: EdgeInsets.all(0),
      dividerHeight: 0,
      tabAlignment: TabAlignment.center,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.white,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.grey2,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.grey5,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(10)),
    textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.grey2,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: AppColors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: AppColors.white,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 11,
          color: AppColors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.grey2,
        )),
  );
}

class AppColors {
  AppColors._();

  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const grey2 = Color.fromRGBO(188, 188, 191, 1);
  static const grey4 = Color.fromRGBO(242, 242, 242, 1);
  static const grey5 = Color.fromRGBO(225, 221, 216, 1);
  static const orange = Color.fromRGBO(255, 135, 2, 1);
  static const shadowColor = Color.fromRGBO(182, 161, 192, 0.11);
  static const black = Color.fromRGBO(76, 76, 105, 1);
}
