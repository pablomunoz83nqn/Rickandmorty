import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/theme/colors_theme.dart';

class AppTheme {
  static ThemeData light() {
    final ThemeData theme = ThemeData(
      primarySwatch: ColorsAppTheme.primarySwatch,
    );

    return theme.copyWith(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: ColorsAppTheme.primarySwatch[300],
        scaffoldBackgroundColor: ColorsAppTheme.greyAppPalette[50],
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: theme.colorScheme.copyWith(
            primary: ColorsAppTheme.primarySwatch[300],
            secondary: ColorsAppTheme.acentColor));
  }
}
