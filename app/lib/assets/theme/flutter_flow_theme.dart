// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryContainer;
  late Color secondaryContainer;
  late Color tertiaryContainer;
  late Color errorContainer;
  late Color onPrimaryContainer;
  late Color onSecondaryContainer;
  late Color onTertiaryContainer;
  late Color onErrorContainer;
  late Color onBackground;
  late Color outline;
  late Color overlayPrimary;
  late Color overlaySecondary;
  late Color overlayTertiary;
  late Color inactiveBottomBar;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;
<<<<<<< Updated upstream
=======
  late Color errorContainer;
  late Color onErrorContainer;
  late Color inactiveBottomBar;
>>>>>>> Stashed changes

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

//  * Início da definição do Light Mode
class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF305DA8);
  late Color secondary = const Color(0xFF676000);
  late Color tertiary = const Color(0xFF944B00);
  late Color alternate = const Color(0xFF84746A);
  late Color primaryText = const Color(0xFF170A00);
  late Color secondaryText = const Color(0xFF52443B);
  late Color primaryBackground = const Color(0xFFF3DFD2);
  late Color secondaryBackground = const Color(0xFFFFFBFF);
  late Color accent1 = const Color(0x4D305DA8);
  late Color accent2 = const Color(0x4D676000);
  late Color accent3 = const Color(0x4D944B00);
  late Color accent4 = const Color(0x4D84746A);
  late Color success = const Color(0xFF2ECC71);
<<<<<<< Updated upstream
  late Color warning = const Color(0xFFF5E63D);
  late Color error = const Color(0xFFBA1A1A);
  late Color info = const Color(0xFFD8E2FF);

  late Color primaryContainer = const Color(0xFF001A41);
  late Color secondaryContainer = const Color(0xFF1F1C00);
  late Color tertiaryContainer = const Color(0xFF301400);
  late Color errorContainer = const Color(0xFF410002);
  late Color onPrimaryContainer = const Color(0xFFD8E2FF);
  late Color onSecondaryContainer = const Color(0xFFF5E63D);
  late Color onTertiaryContainer = const Color(0xFFFFDCC5);
  late Color onErrorContainer = const Color(0xFFFFDAD6);
  late Color onBackground = const Color(0xFF343434);
  late Color outline = const Color(0xFF84746A);
  late Color overlayPrimary = const Color(0xFFA9BFFF);
  late Color overlaySecondary = const Color(0xFFFFF583);
  late Color overlayTertiary = const Color(0xFF624128);
=======
  late Color warning = const Color(0xFFf5e63d);
  late Color error = const Color(0xFFba1a1a);
  late Color info = const Color(0xFF2F56CC);
  late Color errorContainer = const Color(0xFF93000a);
  late Color onErrorContainer = const Color(0xFFffdad6);
>>>>>>> Stashed changes
  late Color inactiveBottomBar = const Color(0xFF8FABFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Jost';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 26.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Jost';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
      );
  String get displaySmallFamily => 'Jost';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineLargeFamily => 'Jost';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineMediumFamily => 'Jost';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineSmallFamily => 'Jost';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
      );
  String get titleLargeFamily => 'Jost';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get titleMediumFamily => 'Inter';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get titleSmallFamily => 'Jost';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get labelLargeFamily => 'Inter';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        fontStyle: FontStyle.normal,
      );
  String get labelMediumFamily => 'Inter';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
        fontStyle: FontStyle.normal,
      );
  String get labelSmallFamily => 'Inter';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        fontStyle: FontStyle.italic,
      );
  String get bodyLargeFamily => 'Jost';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get bodyMediumFamily => 'Jost';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get bodySmallFamily => 'Jost';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Jost';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Jost';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
      );
  String get displaySmallFamily => 'Jost';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineLargeFamily => 'Jost';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineMediumFamily => 'Jost';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineSmallFamily => 'Jost';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get titleLargeFamily => 'Jost';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
      );
  String get titleMediumFamily => 'Inter';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        fontStyle: FontStyle.normal,
      );
  String get titleSmallFamily => 'Jost';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.info,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
      );
  String get labelLargeFamily => 'Inter';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
      );
  String get labelMediumFamily => 'Inter';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get labelSmallFamily => 'Inter';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get bodyLargeFamily => 'Inter';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get bodyMediumFamily => 'Jost';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get bodySmallFamily => 'Jost';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Jost';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Jost';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
      );
  String get displaySmallFamily => 'Jost';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineLargeFamily => 'Jost';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineMediumFamily => 'Jost';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineSmallFamily => 'Jost';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get titleLargeFamily => 'Jost';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
      );
  String get titleMediumFamily => 'Inter';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        fontStyle: FontStyle.normal,
      );
  String get titleSmallFamily => 'Jost';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.info,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
      );
  String get labelLargeFamily => 'Inter';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
      );
  String get labelMediumFamily => 'Inter';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get labelSmallFamily => 'Inter';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Jost',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get bodyLargeFamily => 'Jost';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get bodyMediumFamily => 'Jost';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get bodySmallFamily => 'Jost';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Jost',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
}

//  * Início da definição do Dark Mode
class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFADC6FF);
  late Color secondary = const Color(0xFFD4CA51);
  late Color tertiary = const Color(0xFFFFB783);
  late Color alternate = const Color(0xFF8E9099);
  late Color primaryText = const Color(0xFFEEEEEE);
  late Color secondaryText = const Color(0xFFCDCDCD);
  late Color primaryBackground = const Color(0xFF111111);
  late Color secondaryBackground = const Color(0xFF333333);
  late Color accent1 = const Color(0x4DADC6FF);
  late Color accent2 = const Color(0x4DD4CA51);
  late Color accent3 = const Color(0x4DFFB783);
  late Color accent4 = const Color(0x4D8E9099);
  late Color success = const Color(0xFF8AFFBB);
  late Color warning = const Color(0xFFFFF58A);
  late Color error = const Color(0xFFFFACA3);
<<<<<<< Updated upstream
  late Color info = const Color(0xFFD8E2FF);

  late Color primaryContainer = const Color(0xFFD8E2FF);
  late Color secondaryContainer = const Color(0xFFFFFC7A);
  late Color tertiaryContainer = const Color(0xFFFFDCC5);
  late Color errorContainer = const Color(0xFF93000A);
  late Color onPrimaryContainer = const Color(0xFF002E68);
  late Color onSecondaryContainer = const Color(0xFF1F1C00);
  late Color onTertiaryContainer = const Color(0xFF301400);
  late Color onErrorContainer = const Color(0xFFFFDAD6);
  late Color onBackground = const Color(0xFFCDCDCD);
  late Color outline = const Color(0xFF84746A);
  late Color overlayPrimary = const Color(0xFFA9BFFF);
  late Color overlaySecondary = const Color(0xFFFFF583);
  late Color overlayTertiary = const Color(0xFF624128);
  late Color inactiveBottomBar = const Color(0xFF7598FF);
=======
  late Color info = const Color(0xFFd8e2ff);
  late Color errorContainer = const Color(0xFFffdad6);
  late Color onErrorContainer = const Color(0xFF93000a);
  late Color inactiveBottomBar = const Color(0xFF8FABFF);
>>>>>>> Stashed changes
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}