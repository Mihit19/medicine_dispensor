import 'package:apptofiretorasbpi/utils/theme/custom_themes/appbar_theme.dart';
import 'package:apptofiretorasbpi/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:apptofiretorasbpi/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:apptofiretorasbpi/utils/theme/custom_themes/chip_theme.dart';
import 'package:apptofiretorasbpi/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:apptofiretorasbpi/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:apptofiretorasbpi/utils/theme/custom_themes/text_field_theme.dart';
import 'package:apptofiretorasbpi/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class EEAppTheme{
  EEAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: EETextTheme.lightTextTheme,
    chipTheme: EEChipTheme.lightChipTheme,
    appBarTheme: EEAppBarTheme.lightAppBarTheme,
    checkboxTheme: EECheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: EEBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: EEElevateButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EEOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: EETextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: EETextTheme.darkTextTheme,
    chipTheme: EEChipTheme.darkChipTheme,
    appBarTheme: EEAppBarTheme.darkAppBarTheme,
    checkboxTheme: EECheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: EEBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: EEElevateButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EEOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: EETextFormFieldTheme.darkInputDecorationTheme,
  );
}