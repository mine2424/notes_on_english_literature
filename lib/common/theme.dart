import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

const _lightColor = Color(0xFFfafafa);
const _darkColor = Color(0xFF262A2D);

// 全般的に用いられる色
const _secondaryColor = Color(0xFFf15e6e);
const _grayColor = Color(0xFFA0A4A8);

class AppTheme {
  static ThemeData get light {
    return _themeData(
      colorScheme: const ColorScheme.light(
        primary: _lightColor,
        background: _lightColor,
        secondary: _secondaryColor,
      ),
    );
  }

  static ThemeData get dark {
    return _themeData(
      colorScheme: ColorScheme.dark(
        primary: _darkColor,
        background: _darkColor,
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

    final _contraryColor =
        (colorScheme.primary == _darkColor) ? _lightColor : _darkColor;

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
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: _contraryColor,
        selectedItemColor: _secondaryColor,
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
            headline5: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
            headline6: TextStyle(
              fontSize: 28,
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
              color: _grayColor,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        );
  }

  static Map<String, Map<String, TextStyle>> highlightTextStyles(
    BuildContext context,
  ) {
    return {
      '//[': {
        '[': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.yellow[400],
              fontWeight: FontWeight.w700,
            )
      },
      ']//': {
        ']': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.yellow[400],
              fontWeight: FontWeight.w700,
            )
      },
      '//{': {
        '{': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            )
      },
      '}//': {
        '}': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            )
      },
      '//<': {
        '<': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.green[400],
              fontWeight: FontWeight.w700,
            )
      },
      '>//': {
        '>': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.green[400],
              fontWeight: FontWeight.w700,
            )
      },
      '//(': {
        '(': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.blue[400],
              fontWeight: FontWeight.w700,
            )
      },
      ')//': {
        ')': Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.blue[400],
              fontWeight: FontWeight.w700,
            )
      }
    };
  }
}
