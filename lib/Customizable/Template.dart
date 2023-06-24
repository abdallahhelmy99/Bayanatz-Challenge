// ignore_for_file: file_names

import 'dart:ui';

class Template {
  static double font = 20;
  static FontStyle fontStyle = FontStyle.normal;
  static double logoWidth = 80;
  static double logoHeight = 80;
  
  static double fontSize() {
    return font;
  }  
  static double logoSize() {
    return logoWidth*logoHeight;
  }

  //setter for logo size
  static void setLogoSize(double width, double height) {
    logoWidth = width;
    logoHeight = height;
  }
}
