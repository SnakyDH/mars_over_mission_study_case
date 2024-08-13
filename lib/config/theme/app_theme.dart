import "package:flutter/material.dart";

class AppTheme {
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4a4),
      surfaceTint: Color(0xffffb4a4),
      onPrimary: Color(0xff561f13),
      primaryContainer: Color(0xff733427),
      onPrimaryContainer: Color(0xffffdad3),
      secondary: Color(0xffe7bdb4),
      onSecondary: Color(0xff442a24),
      secondaryContainer: Color(0xff5d3f39),
      onSecondaryContainer: Color(0xffffdad3),
      tertiary: Color(0xffdbc48c),
      onTertiary: Color(0xff3c2f04),
      tertiaryContainer: Color(0xff544519),
      onTertiaryContainer: Color(0xfff8e0a6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a110f),
      onSurface: Color(0xfff1dfdb),
      onSurfaceVariant: Color(0xffd8c2bd),
      outline: Color(0xffa08c88),
      outlineVariant: Color(0xff534340),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfdb),
      inversePrimary: Color(0xff904b3c),
      primaryFixed: Color(0xffffdad3),
      onPrimaryFixed: Color(0xff3a0a03),
      primaryFixedDim: Color(0xffffb4a4),
      onPrimaryFixedVariant: Color(0xff733427),
      secondaryFixed: Color(0xffffdad3),
      onSecondaryFixed: Color(0xff2c1510),
      secondaryFixedDim: Color(0xffe7bdb4),
      onSecondaryFixedVariant: Color(0xff5d3f39),
      tertiaryFixed: Color(0xfff8e0a6),
      onTertiaryFixed: Color(0xff241a00),
      tertiaryFixedDim: Color(0xffdbc48c),
      onTertiaryFixedVariant: Color(0xff544519),
      surfaceDim: Color(0xff1a110f),
      surfaceBright: Color(0xff423734),
      surfaceContainerLowest: Color(0xff140c0a),
      surfaceContainerLow: Color(0xff231917),
      surfaceContainer: Color(0xff271d1b),
      surfaceContainerHigh: Color(0xff322825),
      surfaceContainerHighest: Color(0xff3d3230),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
