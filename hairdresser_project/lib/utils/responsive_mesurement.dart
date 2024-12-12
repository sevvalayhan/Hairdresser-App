import 'package:flutter/material.dart';

class ResponsiveMesurement {
  final BuildContext context;
  late final double _screenWidth;
  late final double _screenHeight;
  late final Orientation _orientation;

  ResponsiveMesurement(this.context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _orientation = MediaQuery.of(context).orientation;
  }

  /// Validate that the input percent is within a proper range [0, 100]
 static double _validatePercentage(double percent) {
    assert(percent >= 0 && percent <= 100, "Percentage must be between 0 and 100");
    return percent;
  }

  /// Returns a percentage of the screen width
  double width(double percent) {
    return _screenWidth * _validatePercentage(percent) / 100;
  }

  /// Returns a percentage of the screen height
  double height(double percent) {
    return _screenHeight * _validatePercentage(percent) / 100;
  }


    /// Returns a percentage of the screen width
  static double asWidth(BuildContext context,double percent) {
    var s = MediaQuery.of(context).size.width;

    return s * _validatePercentage(percent) / 100;
  }

  /// Returns a percentage of the screen height
 static double asHeight(BuildContext context,double percent) {
    var h = MediaQuery.of(context).size.height;
  
    return h * _validatePercentage(percent) / 100;
  }


  /// Returns a responsive font size based on screen width or height (adaptive)
  double font(double percent, {bool adaptToHeight = false}) {
    final base = adaptToHeight ? _screenHeight : _screenWidth;
    return base * _validatePercentage(percent) / 100;
  }

  /// Returns a responsive border radius
  double borderRadius(double percent) {
    return _screenWidth * _validatePercentage(percent) / 100;
  }

  /// Returns a responsive icon size
  double iconSize(double percent) {
    return _screenWidth * _validatePercentage(percent) / 100;
  }

  /// Returns a responsive aspect ratio (width divided by height)
  double aspectRatio(double aspectRatio, double widthPercent) {
    return width(widthPercent) / aspectRatio;
  }

  /// Returns a responsive padding
  EdgeInsets padding(double percent) {
    return EdgeInsets.all(width(percent));
  }

  /// Returns a responsive margin
  EdgeInsets margin(double percent) {
    return EdgeInsets.all(width(percent));
  }

  /// Handles orientation change and gives width or height accordingly
  double adaptiveSize(double percent, {bool adaptToHeight = false}) {
    if (_orientation == Orientation.portrait) {
      return width(percent);
    } else {
      return adaptToHeight ? height(percent) : width(percent);
    }
  }

  /// Gets the SafeArea insets
  EdgeInsets get safeAreaInsets => MediaQuery.of(context).padding;

  /// Static method to initialize Responsive without creating multiple instances
  static ResponsiveMesurement of(BuildContext context) {
    return ResponsiveMesurement(context);
  }

  /// Static helper for safer and easier usage
  static double widthPercent(BuildContext context, double percent) {
    return ResponsiveMesurement(context).width(percent);
  }

  static double heightPercent(BuildContext context, double percent) {
    return ResponsiveMesurement(context).height(percent);
  }

  static double fontPercent(BuildContext context, double percent, {bool adaptToHeight = false}) {
    return ResponsiveMesurement(context).font(percent, adaptToHeight: adaptToHeight);
  }

  static double borderRadiusPercent(BuildContext context, double percent) {
    return ResponsiveMesurement(context).borderRadius(percent);
  }

  static double iconSizePercent(BuildContext context, double percent) {
    return ResponsiveMesurement(context).iconSize(percent);
  }

  static EdgeInsets paddingPercent(BuildContext context, double percent) {
    return ResponsiveMesurement(context).padding(percent);
  }

  static EdgeInsets marginPercent(BuildContext context, double percent) {
    return ResponsiveMesurement.of(context).margin(percent);
  }
}
