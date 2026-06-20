import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.emergency,
        background: AppColors.background,
        surface: AppColors.background,
        onPrimary: Colors.white,
        onBackground: AppColors.textMain,
        onSurface: AppColors.textMain,
      ),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: TextTheme(
        // Titles (Outfit SemiBold)
        displayLarge: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: GoogleFonts.outfit(
          color: AppColors.textMain,
          fontWeight: FontWeight.w600,
        ),
        // Body (Inter Regular)
        bodyLarge: GoogleFonts.inter(
          color: AppColors.textMain,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.inter(
          color: AppColors.textMain,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w400,
        ),
        // Numbers/Labels (Inter Medium)
        labelLarge: GoogleFonts.inter(
          color: AppColors.textMain,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 4, // Ombres très douces
        shadowColor: Colors.black.withOpacity(0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // Coins 24px
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundSecondary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: AppColors.emergency, width: 1),
        ),
        labelStyle: GoogleFonts.inter(color: AppColors.textSecondary),
        hintStyle: GoogleFonts.inter(color: AppColors.textSecondary),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
