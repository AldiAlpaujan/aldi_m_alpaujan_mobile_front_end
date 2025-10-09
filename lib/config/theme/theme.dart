import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // font family
  static const fontFamily = "Poppins";

  // main UI color
  static const primaryColor = Color(0xFF42A04B);
  static const bgColor = Colors.white;
  static const borderColor = Color(0xFFDFDFDF);
  static const textFieldBorderColor = Color(0xFFD5D8E2);
  static const bgImgColor = Color(0xFFF5F5F5);

  // typography color
  static const shadowColor = Color(0x18000000);
  static const titleColor = Color(0xFF252525);
  static const bodyColor = Color(0xFF414141);
  static const capColor = Color(0xFFA2A2A2);

  // allert color
  static const successColor = Color(0xFF009E0F);
  static const warningColor = Color(0xFFF57C00);
  static const errorColor = Color(0xFFF44336);

  // allert accent color
  static const successAccentColor = Color(0xFFB6D7A8);
  static const orangeAccent = Color(0xFFF9CB9C);
  static const redAccent = Color(0xFFEF9A9A);

  // application default padding
  static const padding = 16.0;

  // localizations
  static const localizationsDelegates = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static const supportedLocales = [Locale('en'), Locale('id')];

  // dialog theme
  static const titleDialogStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const contentDialogStyle = TextStyle(fontSize: 14);
  static const contentPaddingDialog = EdgeInsets.fromLTRB(24, 12, 24, 8);

  //
  // color scheme
  //
  static final colorScheme = ThemeData().colorScheme.copyWith(
    primary: primaryColor,
    error: errorColor,
  );

  //
  // app bar theme
  //
  static const appBarTheme = AppBarTheme(
    color: primaryColor,
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  );

  //
  // button theme configuration
  //
  static final btnTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
    ),
  );
  static const btnStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const floatBtnTheme = FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  );

  //
  // AppTextField decoration configuration
  //
  static const _borderTextFieldInput = OutlineInputBorder(
    borderSide: BorderSide(color: AppTheme.textFieldBorderColor, width: 1),
  );
  static final textFieldInputDecoration = InputDecoration(
    isDense: true,
    border: _borderTextFieldInput,
    enabledBorder: _borderTextFieldInput,
    focusedBorder: _borderTextFieldInput.copyWith(
      borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1),
    ),
    focusedErrorBorder: _borderTextFieldInput.copyWith(
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    hintStyle: const TextStyle(color: AppTheme.capColor, fontSize: 12),
  );
}
