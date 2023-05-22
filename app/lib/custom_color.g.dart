import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const green = Color(0xFF52CCA6);
const brown = Color(0xFFCCA88F);
const purple = Color(0xFF937ACC);
const pink = Color(0xFFCC85C2);
const yellow = Color(0xFFCCC566);


CustomColors lightCustomColors = const CustomColors(
  sourceGreen: Color(0xFF52CCA6),
  green: Color(0xFF006C53),
  onGreen: Color(0xFFFFFFFF),
  greenContainer: Color(0xFF81F8D0),
  onGreenContainer: Color(0xFF002117),
  sourceBrown: Color(0xFFCCA88F),
  brown: Color(0xFF924C00),
  onBrown: Color(0xFFFFFFFF),
  brownContainer: Color(0xFFFFDCC4),
  onBrownContainer: Color(0xFF2F1400),
  sourcePurple: Color(0xFF937ACC),
  purple: Color(0xFF694FA3),
  onPurple: Color(0xFFFFFFFF),
  purpleContainer: Color(0xFFEADDFF),
  onPurpleContainer: Color(0xFF24005B),
  sourcePink: Color(0xFFCC85C2),
  pink: Color(0xFF8B4484),
  onPink: Color(0xFFFFFFFF),
  pinkContainer: Color(0xFFFFD7F5),
  onPinkContainer: Color(0xFF380038),
  sourceYellow: Color(0xFFCCC566),
  yellow: Color(0xFF666000),
  onYellow: Color(0xFFFFFFFF),
  yellowContainer: Color(0xFFEFE66C),
  onYellowContainer: Color(0xFF1E1C00),
);

CustomColors darkCustomColors = const CustomColors(
  sourceGreen: Color(0xFF52CCA6),
  green: Color(0xFF63DBB4),
  onGreen: Color(0xFF00382A),
  greenContainer: Color(0xFF00513E),
  onGreenContainer: Color(0xFF81F8D0),
  sourceBrown: Color(0xFFCCA88F),
  brown: Color(0xFFFFB780),
  onBrown: Color(0xFF4E2600),
  brownContainer: Color(0xFF6F3800),
  onBrownContainer: Color(0xFFFFDCC4),
  sourcePurple: Color(0xFF937ACC),
  purple: Color(0xFFD1BCFF),
  onPurple: Color(0xFF3A1D71),
  purpleContainer: Color(0xFF513789),
  onPurpleContainer: Color(0xFFEADDFF),
  sourcePink: Color(0xFFCC85C2),
  pink: Color(0xFFFFABF3),
  onPink: Color(0xFF551352),
  pinkContainer: Color(0xFF6F2C6B),
  onPinkContainer: Color(0xFFFFD7F5),
  sourceYellow: Color(0xFFCCC566),
  yellow: Color(0xFFD2CA53),
  onYellow: Color(0xFF353200),
  yellowContainer: Color(0xFF4C4800),
  onYellowContainer: Color(0xFFEFE66C),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceGreen,
    required this.green,
    required this.onGreen,
    required this.greenContainer,
    required this.onGreenContainer,
    required this.sourceBrown,
    required this.brown,
    required this.onBrown,
    required this.brownContainer,
    required this.onBrownContainer,
    required this.sourcePurple,
    required this.purple,
    required this.onPurple,
    required this.purpleContainer,
    required this.onPurpleContainer,
    required this.sourcePink,
    required this.pink,
    required this.onPink,
    required this.pinkContainer,
    required this.onPinkContainer,
    required this.sourceYellow,
    required this.yellow,
    required this.onYellow,
    required this.yellowContainer,
    required this.onYellowContainer,
  });

  final Color? sourceGreen;
  final Color? green;
  final Color? onGreen;
  final Color? greenContainer;
  final Color? onGreenContainer;
  final Color? sourceBrown;
  final Color? brown;
  final Color? onBrown;
  final Color? brownContainer;
  final Color? onBrownContainer;
  final Color? sourcePurple;
  final Color? purple;
  final Color? onPurple;
  final Color? purpleContainer;
  final Color? onPurpleContainer;
  final Color? sourcePink;
  final Color? pink;
  final Color? onPink;
  final Color? pinkContainer;
  final Color? onPinkContainer;
  final Color? sourceYellow;
  final Color? yellow;
  final Color? onYellow;
  final Color? yellowContainer;
  final Color? onYellowContainer;

  @override
  CustomColors copyWith({
    Color? sourceGreen,
    Color? green,
    Color? onGreen,
    Color? greenContainer,
    Color? onGreenContainer,
    Color? sourceBrown,
    Color? brown,
    Color? onBrown,
    Color? brownContainer,
    Color? onBrownContainer,
    Color? sourcePurple,
    Color? purple,
    Color? onPurple,
    Color? purpleContainer,
    Color? onPurpleContainer,
    Color? sourcePink,
    Color? pink,
    Color? onPink,
    Color? pinkContainer,
    Color? onPinkContainer,
    Color? sourceYellow,
    Color? yellow,
    Color? onYellow,
    Color? yellowContainer,
    Color? onYellowContainer,
  }) {
    return CustomColors(
      sourceGreen: sourceGreen ?? this.sourceGreen,
      green: green ?? this.green,
      onGreen: onGreen ?? this.onGreen,
      greenContainer: greenContainer ?? this.greenContainer,
      onGreenContainer: onGreenContainer ?? this.onGreenContainer,
      sourceBrown: sourceBrown ?? this.sourceBrown,
      brown: brown ?? this.brown,
      onBrown: onBrown ?? this.onBrown,
      brownContainer: brownContainer ?? this.brownContainer,
      onBrownContainer: onBrownContainer ?? this.onBrownContainer,
      sourcePurple: sourcePurple ?? this.sourcePurple,
      purple: purple ?? this.purple,
      onPurple: onPurple ?? this.onPurple,
      purpleContainer: purpleContainer ?? this.purpleContainer,
      onPurpleContainer: onPurpleContainer ?? this.onPurpleContainer,
      sourcePink: sourcePink ?? this.sourcePink,
      pink: pink ?? this.pink,
      onPink: onPink ?? this.onPink,
      pinkContainer: pinkContainer ?? this.pinkContainer,
      onPinkContainer: onPinkContainer ?? this.onPinkContainer,
      sourceYellow: sourceYellow ?? this.sourceYellow,
      yellow: yellow ?? this.yellow,
      onYellow: onYellow ?? this.onYellow,
      yellowContainer: yellowContainer ?? this.yellowContainer,
      onYellowContainer: onYellowContainer ?? this.onYellowContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceGreen: Color.lerp(sourceGreen, other.sourceGreen, t),
      green: Color.lerp(green, other.green, t),
      onGreen: Color.lerp(onGreen, other.onGreen, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      onGreenContainer: Color.lerp(onGreenContainer, other.onGreenContainer, t),
      sourceBrown: Color.lerp(sourceBrown, other.sourceBrown, t),
      brown: Color.lerp(brown, other.brown, t),
      onBrown: Color.lerp(onBrown, other.onBrown, t),
      brownContainer: Color.lerp(brownContainer, other.brownContainer, t),
      onBrownContainer: Color.lerp(onBrownContainer, other.onBrownContainer, t),
      sourcePurple: Color.lerp(sourcePurple, other.sourcePurple, t),
      purple: Color.lerp(purple, other.purple, t),
      onPurple: Color.lerp(onPurple, other.onPurple, t),
      purpleContainer: Color.lerp(purpleContainer, other.purpleContainer, t),
      onPurpleContainer: Color.lerp(onPurpleContainer, other.onPurpleContainer, t),
      sourcePink: Color.lerp(sourcePink, other.sourcePink, t),
      pink: Color.lerp(pink, other.pink, t),
      onPink: Color.lerp(onPink, other.onPink, t),
      pinkContainer: Color.lerp(pinkContainer, other.pinkContainer, t),
      onPinkContainer: Color.lerp(onPinkContainer, other.onPinkContainer, t),
      sourceYellow: Color.lerp(sourceYellow, other.sourceYellow, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      onYellow: Color.lerp(onYellow, other.onYellow, t),
      yellowContainer: Color.lerp(yellowContainer, other.yellowContainer, t),
      onYellowContainer: Color.lerp(onYellowContainer, other.onYellowContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceGreen]
  ///   * [CustomColors.green]
  ///   * [CustomColors.onGreen]
  ///   * [CustomColors.greenContainer]
  ///   * [CustomColors.onGreenContainer]
  ///   * [CustomColors.sourceBrown]
  ///   * [CustomColors.brown]
  ///   * [CustomColors.onBrown]
  ///   * [CustomColors.brownContainer]
  ///   * [CustomColors.onBrownContainer]
  ///   * [CustomColors.sourcePurple]
  ///   * [CustomColors.purple]
  ///   * [CustomColors.onPurple]
  ///   * [CustomColors.purpleContainer]
  ///   * [CustomColors.onPurpleContainer]
  ///   * [CustomColors.sourcePink]
  ///   * [CustomColors.pink]
  ///   * [CustomColors.onPink]
  ///   * [CustomColors.pinkContainer]
  ///   * [CustomColors.onPinkContainer]
  ///   * [CustomColors.sourceYellow]
  ///   * [CustomColors.yellow]
  ///   * [CustomColors.onYellow]
  ///   * [CustomColors.yellowContainer]
  ///   * [CustomColors.onYellowContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceGreen: sourceGreen!.harmonizeWith(dynamic.primary),
      green: green!.harmonizeWith(dynamic.primary),
      onGreen: onGreen!.harmonizeWith(dynamic.primary),
      greenContainer: greenContainer!.harmonizeWith(dynamic.primary),
      onGreenContainer: onGreenContainer!.harmonizeWith(dynamic.primary),
      sourceBrown: sourceBrown!.harmonizeWith(dynamic.primary),
      brown: brown!.harmonizeWith(dynamic.primary),
      onBrown: onBrown!.harmonizeWith(dynamic.primary),
      brownContainer: brownContainer!.harmonizeWith(dynamic.primary),
      onBrownContainer: onBrownContainer!.harmonizeWith(dynamic.primary),
      sourcePurple: sourcePurple!.harmonizeWith(dynamic.primary),
      purple: purple!.harmonizeWith(dynamic.primary),
      onPurple: onPurple!.harmonizeWith(dynamic.primary),
      purpleContainer: purpleContainer!.harmonizeWith(dynamic.primary),
      onPurpleContainer: onPurpleContainer!.harmonizeWith(dynamic.primary),
      sourcePink: sourcePink!.harmonizeWith(dynamic.primary),
      pink: pink!.harmonizeWith(dynamic.primary),
      onPink: onPink!.harmonizeWith(dynamic.primary),
      pinkContainer: pinkContainer!.harmonizeWith(dynamic.primary),
      onPinkContainer: onPinkContainer!.harmonizeWith(dynamic.primary),
      sourceYellow: sourceYellow!.harmonizeWith(dynamic.primary),
      yellow: yellow!.harmonizeWith(dynamic.primary),
      onYellow: onYellow!.harmonizeWith(dynamic.primary),
      yellowContainer: yellowContainer!.harmonizeWith(dynamic.primary),
      onYellowContainer: onYellowContainer!.harmonizeWith(dynamic.primary),
    );
  }
}