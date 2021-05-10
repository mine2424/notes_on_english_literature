import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 全般的に用いられる色
const _defaultTextColor = Color(0xFF514644);
const _primaryColor = Color(0xFF201E1F);
const _secondaryColor = Color(0xFF475411);

class AppTheme {
  static ThemeData get light {
    return _themeData(
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
      ),
    );
  }

  static ThemeData get dark {
    return _themeData(
      colorScheme: ColorScheme.dark(
        primary: _primaryColor,
        secondary: _secondaryColor,
        onPrimary: const ColorScheme.light().onPrimary,
      ),
    );
  }

  static ThemeData _themeData({required ColorScheme colorScheme}) {
    final baseData = ThemeData.from(
      colorScheme: colorScheme,
    );

    return baseData.copyWith(
      appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        labelStyle: const TextStyle(fontSize: 14.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: _primaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: _primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: baseData.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: baseData.errorColor),
        ),
      ),
    );
  }
}
