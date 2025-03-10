import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  ThemeData get light => lightTheme(ThemeData.light().textTheme);

  ThemeData get dark => darkTheme(ThemeData.dark().textTheme);

  static lightTheme(TextTheme textTheme) => ThemeData(
        colorScheme: lightColorScheme,
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF06B2A2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          bodyLarge: GoogleFonts.poppins(
            textStyle: textTheme.bodyLarge,
          ),
          bodyMedium: GoogleFonts.poppins(
            textStyle: textTheme.bodyMedium,
          ),
          labelLarge: GoogleFonts.poppins(
            textStyle: textTheme.labelLarge,
          ),
          bodySmall: GoogleFonts.poppins(
            textStyle: textTheme.bodySmall,
          ),
          displayLarge: GoogleFonts.poppins(
            textStyle: textTheme.displayLarge,
          ),
          displayMedium: GoogleFonts.poppins(
            textStyle: textTheme.displayMedium,
          ),
          displaySmall: GoogleFonts.poppins(
            textStyle: textTheme.displaySmall,
          ),
          headlineMedium: GoogleFonts.poppins(
            textStyle: textTheme.headlineMedium,
          ),
          headlineSmall: GoogleFonts.poppins(
            textStyle: textTheme.headlineSmall,
          ),
          titleLarge: GoogleFonts.poppins(
            textStyle: textTheme.titleLarge,
          ),
          labelSmall: GoogleFonts.poppins(
            textStyle: textTheme.labelSmall,
          ),
          titleMedium: GoogleFonts.poppins(
            textStyle: textTheme.titleMedium,
          ),
          titleSmall: GoogleFonts.poppins(
            textStyle: textTheme.titleSmall,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          filled: true,
          fillColor: const Color(0xffbec4c9).withValues(alpha: 0.2),
          // filled: true,
          // fillColor: Color(0xFF8A99B0).withValues(alpha: 0.5),
          helperStyle: textTheme.bodyMedium?.copyWith(
            color: const Color(0xffbec4c9),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      );

  static ThemeData darkTheme(TextTheme textTheme) => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
        inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          // filled: true,
          // fillColor: const Color(0xFF2B2D44).withValues(alpha: 0.3),
          helperStyle: textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF8A99B0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
        // Google Text Theme monospace
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          bodyLarge: GoogleFonts.poppins(
            textStyle: textTheme.bodyLarge,
          ),
          bodyMedium: GoogleFonts.poppins(
            textStyle: textTheme.bodyMedium,
          ),
          labelLarge: GoogleFonts.poppins(
            textStyle: textTheme.labelLarge,
          ),
          bodySmall: GoogleFonts.poppins(
            textStyle: textTheme.bodySmall,
          ),
          displayLarge: GoogleFonts.poppins(
            textStyle: textTheme.displayLarge,
          ),
          displayMedium: GoogleFonts.poppins(
            textStyle: textTheme.displayMedium,
          ),
          displaySmall: GoogleFonts.poppins(
            textStyle: textTheme.displaySmall,
          ),
          headlineMedium: GoogleFonts.poppins(
            textStyle: textTheme.headlineMedium,
          ),
          headlineSmall: GoogleFonts.poppins(
            textStyle: textTheme.headlineSmall,
          ),
          titleLarge: GoogleFonts.poppins(
            textStyle: textTheme.titleLarge,
          ),
          labelSmall: GoogleFonts.poppins(
            textStyle: textTheme.labelSmall,
          ),
          titleMedium: GoogleFonts.poppins(
            textStyle: textTheme.titleMedium,
          ),
          titleSmall: GoogleFonts.poppins(
            textStyle: textTheme.titleSmall,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF06B2A2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );

  static TextStyle viewScreenTextStyle({double fontSize = 16, Color color = Colors.black, FontWeight fontWeight = FontWeight.bold}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      letterSpacing: 1,
      fontWeight: fontWeight,
    );
  }

  static TextStyle settleTextStyle() {
    return const TextStyle(
      fontSize: 20,
      color: Colors.white,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
    );
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF06B2A2),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF00382E),
  onPrimaryContainer: Color(0xFF06B2A2),
  secondary: Color(0xFF006878),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFA7EDFF),
  onSecondaryContainer: Color(0xFF001F25),
  tertiary: Color(0xFF4E57A9),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFE0E0FF),
  onTertiaryContainer: Color(0xFF020865),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFF8FDFF),
  onSurface: Color(0xFF001F25),
  surfaceContainerHighest: Color(0xFFDDE5E5),
  onSurfaceVariant: Color(0xFF3F4848),
  outline: Color(0xFF707A7A),
  outlineVariant: Color(0xFFC4CCCC),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF00363F),
  onInverseSurface: Color(0xFFA9DCE1),
  inversePrimary: Color(0xFF004D42),
  surfaceTint: Color(0xFF06B2A2),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF06B2A2),
  onPrimary: Color.fromARGB(255, 3, 101, 91),
  primaryContainer: Color.fromARGB(255, 3, 101, 91),
  onPrimaryContainer: Color(0xFFFFDAD7),
  secondary: Color(0xFF53D7F2),
  onSecondary: Color(0xFF00363F),
  secondaryContainer: Color(0xFF004E5B),
  onSecondaryContainer: Color(0xFFA7EDFF),
  tertiary: Color(0xFFBDC2FF),
  onTertiary: Color(0xFF1E2678),
  tertiaryContainer: Color(0xFF363E90),
  onTertiaryContainer: Color(0xFFE0E0FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF001F25),
  onSurface: Color(0xFFA6EEFF),
  surfaceContainerHighest: Color(0xFF534342),
  onSurfaceVariant: Color(0xFFD8C1C0),
  outline: Color(0xFFA08C8B),
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color(0xFFA6EEFF),
  inversePrimary: Color(0xFFBF0023),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB3AF),
  outlineVariant: Color(0xFF534342),
  scrim: Color(0xFF000000),
);
