import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// 全般的に用いられる色
const _lightColor = Color(0xFFfafafa);
const _darkColor = Color(0xFF262A2D);
const _secondaryColor = Color(0xFFf15e6e);

class AppTheme {
  static ThemeData get light {
    return _themeData(
      colorScheme: const ColorScheme.light(
        primary: _lightColor,
        background: _darkColor,
        secondary: _secondaryColor,
      ),
    );
  }

  static ThemeData get dark {
    return _themeData(
      colorScheme: ColorScheme.dark(
        primary: _darkColor,
        background: _lightColor,
        secondary: _secondaryColor,
        onPrimary: const ColorScheme.light().onPrimary,
      ),
    );
  }

  static ThemeData _themeData({required ColorScheme colorScheme}) {
    final baseData = ThemeData.from(
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme),
    );

    return baseData.copyWith(
      appBarTheme: const AppBarTheme(centerTitle: true),
      backgroundColor: colorScheme.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: _lightColor,
          ),
          primary: colorScheme.secondary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(color: _lightColor),
          backgroundColor: colorScheme.secondary,
        ),
      ),
    );
  }

  static TextTheme? _textTheme(ColorScheme scheme) {
    final _displayColor =
        (scheme.primary == _darkColor) ? _lightColor : _darkColor;

    return GoogleFonts.merriweatherTextTheme()
        .apply(
          displayColor: _displayColor,
          bodyColor: _displayColor,
        )
        .merge(
          const TextTheme(
            headline1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
            ),
            headline3: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
            ),
            headline6: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
            bodyText1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
            bodyText2: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            caption: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        );
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => theme.colorScheme.primary;
  Color get secondaryColor => theme.colorScheme.secondary;
  TextStyle get bodyText1 => theme.textTheme.bodyText1!;
  TextStyle get bodyText2 => theme.textTheme.bodyText2!;
  TextStyle get headline1 => theme.textTheme.headline1!;
  TextStyle get headline2 => theme.textTheme.headline2!;
  TextStyle get headline3 => theme.textTheme.headline3!;
  TextStyle get headline4 => theme.textTheme.headline4!;
  TextStyle get headline5 => theme.textTheme.headline5!;
  TextStyle get headline6 => theme.textTheme.headline6!;
  TextStyle get subtitle1 => theme.textTheme.subtitle1!;
  TextStyle get subtitle2 => theme.textTheme.subtitle2!;
  TextStyle get caption => theme.textTheme.caption!;
  TextStyle get overline => theme.textTheme.overline!;
  TextStyle get button => theme.textTheme.button!;
}
