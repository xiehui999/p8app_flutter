import 'package:flutter/material.dart';

final ThemeData darkTheme = _buildDarkTheme();
final ThemeData lightTheme = _buildLightTheme();

ThemeData _buildDarkTheme() {
  Color primaryColor = Color(0xFF0175c2);
  Color secondaryColor = Color(0xFF13B9FD);
  final ThemeData base = ThemeData.dark();
  final ColorScheme colorScheme = ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        textTheme: _buildTextTheme(base.textTheme),
        actionsIconTheme: IconThemeData(color: base.accentColor)),
    accentColor: secondaryColor,
    canvasColor: Color(0xFF202124),
    scaffoldBackgroundColor: Color(0xFF202124),
    backgroundColor: Color(0xFF202124),
    errorColor: Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(color: base.accentColor),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

ThemeData _buildLightTheme() {
  Color primaryColor = Color(0xFF0175c2);
  Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    iconTheme: IconThemeData(color: base.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        textTheme: _buildTextTheme(base.textTheme),
        actionsIconTheme: IconThemeData(color: base.primaryColor)),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1.copyWith(
      fontFamily: 'GoogleSans',
    ),
  );
}
