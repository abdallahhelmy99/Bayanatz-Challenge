import 'package:flutter/widgets.dart';

// Singleton Design Pattern
class ScreenSize {
  static ScreenSize? _instance;
  double? _screenWidth;
  double? _screenHeight;

  factory ScreenSize() {
    _instance ??= ScreenSize._internal();
    return _instance!;
  }

  ScreenSize._internal() {
    final mediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    _screenWidth = mediaQueryData.size.width;
    _screenHeight = mediaQueryData.size.height;
  }

  double? get screenWidth => _screenWidth;
  double? get screenHeight => _screenHeight;
}
