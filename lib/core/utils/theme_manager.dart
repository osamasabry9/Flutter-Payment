import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.primary,
    primarySwatch: Colors.purple,

    // cardView theme
    cardTheme: const CardTheme(
      color: ColorManager.grey,
      shadowColor: ColorManager.black,
      elevation: AppSize.s4,
    ),

    // appBar Theme
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.black,
        statusBarBrightness: Brightness.light,
      ),
      color: ColorManager.darkPrimary,
      elevation: AppSize.s0,
      shadowColor: ColorManager.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: ColorManager.white,
      ),
    ),

    // button Theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: ColorManager.white,
          fontSize: 12,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // text Theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: ColorManager.grey, fontSize: 16, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(
          color: ColorManager.grey, fontSize: 16, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
        color: ColorManager.grey,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
          color: ColorManager.black, fontSize: 16, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(color: ColorManager.grey),
      bodyLarge: TextStyle(color: ColorManager.grey1),
      labelMedium: TextStyle(
          color: ColorManager.grey, fontSize: 16, fontWeight: FontWeight.bold),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: TextStyle(color: ColorManager.grey, fontSize: 14),
      counterStyle: TextStyle(
          color: ColorManager.black, fontSize: 14, fontWeight: FontWeight.w500),
      labelStyle: TextStyle(
          color: ColorManager.black, fontSize: 14, fontWeight: FontWeight.w500),
      errorStyle: TextStyle(color: ColorManager.error, fontSize: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
