import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    useMaterial3: true,
    textTheme: myTextTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4a4a4a)));

final myTextTheme = TextTheme(
  bodyLarge: GoogleFonts.plusJakartaSans(
      fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
  bodyMedium: GoogleFonts.plusJakartaSans(fontSize: 22, color: Colors.white),
  bodySmall: GoogleFonts.plusJakartaSans(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  labelLarge: GoogleFonts.plusJakartaSans(fontSize: 18, color: Colors.white),
  labelMedium: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.white),
);
