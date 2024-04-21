import 'package:flutter/material.dart';

// Define the color palette
const Color primaryColor = Color(0xFF795548); // A deep brown
const Color secondaryColor = Color(0xFFD7CCC8); // A lighter brown
const Color lightBackgroundColor = Color(0xFFFFFBFA); // Soft off-white for backgrounds
const Color accentColor = Color(0xFFA1887F); // A muted clay color
const Color errorColor = Color(0xFFD32F2F); // Standard material error color, for contrast

ThemeData buildRelaxedBrownTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.brown,
      accentColor: accentColor,
      cardColor: secondaryColor,
      backgroundColor: lightBackgroundColor,
      errorColor: errorColor,
    ),
    textTheme: _buildRelaxedBrownTextTheme(base.textTheme),
    primaryTextTheme: _buildRelaxedBrownTextTheme(base.primaryTextTheme),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme _buildRelaxedBrownTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5!.copyWith(fontWeight: FontWeight.w500, color: primaryColor),
    headline6: base.headline6!.copyWith(fontSize: 18.0, color: accentColor),
    caption: base.caption!.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: secondaryColor),
    bodyText2: base.bodyText2!.copyWith(color: Colors.brown[600]),
  ).apply(
    fontFamily: 'Georgia',
  );
}