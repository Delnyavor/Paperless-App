import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Colors.pink,
      error: Colors.red,
    ),

    // TODO: Add the text themes
    // textTheme: GoogleFonts.montserratTextTheme(),

    // TODO: Add the icon themes

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black12.withOpacity(0.36)),
      hintStyle: TextStyle(
        color: Colors.black12.withOpacity(0.36),
        fontSize: 12,
      ),
      alignLabelWithHint: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.5))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(width: 1.5, color: Colors.pink.withOpacity(0.8))),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 1, color: Colors.red.withOpacity(0.5))),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 1, color: Colors.red.withOpacity(0.2))),
    ),
  );
}
