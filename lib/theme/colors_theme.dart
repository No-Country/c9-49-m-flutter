import 'package:flutter/material.dart';

class LightModeColors {
  static const Color primaryColor = Color.fromRGBO(0, 90, 194, 1);
  static const Color secondaryColor = Color.fromARGB(98, 0, 238, 1);
  static const Color accentColor = Color.fromARGB(0, 148, 175, 1);
  static const Color errorColor = Color.fromARGB(186, 26, 26, 1);
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color whiteColor = Color.fromRGBO(230, 230, 230, 1);
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 0.87);
}

const ColorScheme appColorTheme = ColorScheme(
  primary: LightModeColors.primaryColor,
  secondary: LightModeColors.secondaryColor,
  tertiary: LightModeColors.accentColor,
  surface: LightModeColors.whiteColor,
  background: LightModeColors.backgroundColor,
  error: LightModeColors.errorColor,
  onPrimary: LightModeColors.whiteColor,
  onSecondary: LightModeColors.blackColor,
  onSurface: LightModeColors.blackColor,
  onBackground: LightModeColors.blackColor,
  onError: LightModeColors.whiteColor,
  brightness: Brightness.light,
);
