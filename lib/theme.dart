import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static final Color _lightPrimaryColor = Colors.blueGrey.shade100;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _lightTextColorSecondary = Colors.black54;
  static const Color _appbarColorLight = Colors.blue;
  static const Color _inputFieldLight = Colors.white;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static const Color _darkTextColorSecondary = Colors.white70;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;
  static const Color _inputFieldDark = Color.fromRGBO(225, 225, 225, 0.03);

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  // *****************
  // Text Style - light
  // *****************
  static final TextStyle _lightHeadingText = GoogleFonts.rubik(
      color: _lightTextColorPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static final TextStyle _lightTitleBodyText = GoogleFonts.rubik(
      color: _lightTextColorPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 18);

  static final TextStyle _lightBodyText = GoogleFonts.rubik(
      color: _lightTextColorPrimary,
      fontWeight: FontWeight.w600,
      fontSize: 16);

  static final TextStyle _lightBodyTextSmall = GoogleFonts.rubik(
      color: _lightTextColorSecondary,
      fontWeight: FontWeight.w500,
      fontSize: 14);

  static final TextStyle _lightHintText = GoogleFonts.rubik(
      color: _lightTextColorSecondary,
      fontWeight: FontWeight.w400,
      fontSize: 14);

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
    subtitle1: _lightBodyTextSmall,
    subtitle2: _lightHintText,
    headline2: _lightTitleBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
  _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeTitleTextStyle =
  _lightTitleBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyTextStyle =
  _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodySmallTextStyle =
  _lightBodyTextSmall.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeHintTextStyle =
  _lightHintText.copyWith(color: _darkTextColorSecondary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkThemeHeadingTextStyle,
    bodyText1: _darkThemeBodyTextStyle,
    subtitle1: _darkThemeBodySmallTextStyle,
    subtitle2: _darkThemeHintTextStyle,
    headline2: _darkThemeTitleTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor)),
      colorScheme: ColorScheme.light(
        primary: _lightPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
        secondary: _accentColor,
        primaryContainer: _lightPrimaryVariantColor,
      ),
      textTheme: _lightTextTheme,
      bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: const BorderSide(color: _inputFieldLight),
          ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(color: _inputFieldLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(color: _inputFieldLight),
        ),
      ),
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark,
          iconTheme: const IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorDark,
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _accentColor,
        onPrimary: _darkOnPrimaryColor,
        primaryContainer: _darkPrimaryVariantColor,
      ),
      textTheme: _darkTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(color: _inputFieldDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(color: _inputFieldDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(color: _inputFieldDark),
      ),
    ),
  );
}
