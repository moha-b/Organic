part of 'utils.dart';

/// A utility class for handling media queries in the application.
class AppDimensions {
  /// Gets the current [MediaQueryData] instance from the navigator context.
  static MediaQueryData get _mediaQuery =>
      MediaQuery.of(NavigationHelper.navigatorKey.currentContext!);

  /// Gets the width of the application window.
  static double get width => _mediaQuery.size.width;

  /// Gets the height of the application window.
  static double get height => _mediaQuery.size.height;
}

/// An extension for handling dimensions with respect to the screen size for [double] values.
extension DoubleDimensionUtilExtension on double {
  /// Converts the value to a width relative to the screen width.
  double get w => AppDimensions.width * this / 100;

  /// Converts the value to a height relative to the screen height.
  double get h => AppDimensions.height * this / 100;

  /// Converts the value to its proportional value based on the screen width and height.
  double get r => (AppDimensions.width + AppDimensions.height) * this / 2;

  /// Converts the value to a scaled pixel value based on the screen width.
  double get sp => AppDimensions._mediaQuery.textScaleFactor * this;
}

/// An extension for creating [EdgeInsets] with a specified value for [double] values.
extension DoubleEdgeInsetsExtension on double {
  /// Creates [EdgeInsets] with the same value applied to all sides.
  EdgeInsets get allInsets => EdgeInsets.all(this);

  /// Creates [EdgeInsets] with the specified horizontal value.
  EdgeInsets get horizontalInsets => EdgeInsets.symmetric(horizontal: this);

  /// Creates [EdgeInsets] with the specified vertical value.
  EdgeInsets get verticalInsets => EdgeInsets.symmetric(vertical: this);
}

/// An extension for handling dimensions with respect to the screen size for [int] values.
extension IntDimensionUtilExtension on int {
  /// Converts the value to a width relative to the screen width.
  double get w => AppDimensions.width * (toDouble() / AppDimensions.width);

  /// Converts the value to a height relative to the screen height.
  double get h => AppDimensions.height * (toDouble() / AppDimensions.height);

  /// Converts the value to its proportional value based on the screen width and height.
  double get r =>
      ((AppDimensions.width + AppDimensions.height) * toDouble() / 2) /
      (AppDimensions.width + AppDimensions.height);

  /// Converts the value to a scaled pixel value based on the screen width.
  double get sp => AppDimensions._mediaQuery.textScaleFactor * toDouble();
}

/// An extension for creating [EdgeInsets] with a specified value for int values.
extension IntEdgeInsetsExtension on int {
  /// Creates [EdgeInsets] with the same value applied to all sides.
  EdgeInsets get allInsets => EdgeInsets.all(toDouble());

  /// Creates [EdgeInsets] with the specified horizontal value.
  EdgeInsets get horizontalInsets =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates [EdgeInsets] with the specified vertical value.
  EdgeInsets get verticalInsets => EdgeInsets.symmetric(vertical: toDouble());
}
