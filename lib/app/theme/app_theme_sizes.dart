import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Defines horizontal and vertical spacing constants
class AppThemeSpacing {
  /// Horizontal spacing as a percentage of screen width
  static double get extraTinyW => 0.01.sw; // 1% of screen width
  static double get tinyW => 0.015.sw; // 1.5% of screen width
  static double get extraSmallW => 0.02.sw; // 2% of screen width
  static double get smallW => 0.04.sw; // 4% of screen width
  static double get mediumW => 0.06.sw; // 6% of screen width
  static double get largeW => 0.08.sw; // 8% of screen width
  static double get extraLargeW => 0.10.sw; // 10% of screen width
  static double get doubleXLW => 0.12.sw; // 12% of screen width
  static double get tripleXLW => 0.15.sw; // 15% of screen width
  static double get ultraW => 0.20.sw; // 20% of screen width

  /// Vertical spacing as a percentage of screen height
  static double get extraTinyH => 0.01.sh; // 1% of screen height
  static double get tinyH => 0.015.sh; // 1.5% of screen height
  static double get extraSmallH => 0.02.sh; // 2% of screen height
  static double get smallH => 0.04.sh; // 4% of screen height
  static double get mediumH => 0.06.sh; // 6% of screen height
  static double get largeH => 0.08.sh; // 8% of screen height
  static double get extraLargeH => 0.10.sh; // 10% of screen height
  static double get doubleXLH => 0.12.sh; // 12% of screen height
  static double get tripleXLH => 0.15.sh; // 15% of screen height
  static double get ultraH => 0.20.sh; // 20% of screen height
}

/// Defines radii scaled with screen util
class AppThemeRadius {
  static Radius get small => Radius.circular(8.r);
  static Radius get medium => Radius.circular(12.r);
  static Radius get large => Radius.circular(16.r);
  static Radius get extraLarge => Radius.circular(24.r);
  static Radius get doubleXL => Radius.circular(32.r);
  static Radius get tripleXL => Radius.circular(48.r);
}

/// Defines box shadows with scaled blur and offset
class AppThemeShadow {
  static BoxShadow get small => BoxShadow(
        color: Color.fromARGB(10, 0, 0, 0),
        blurRadius: 4.r,
        offset: Offset(0, 2.r),
      );

  static BoxShadow get medium => BoxShadow(
        color: Color.fromARGB(20, 0, 0, 0),
        blurRadius: 8.r,
        offset: Offset(0, 4.r),
      );

  static BoxShadow get large => BoxShadow(
        color: Color.fromARGB(30, 0, 0, 0),
        blurRadius: 12.r,
        offset: Offset(0, 8.r),
      );

  static BoxShadow get extraLarge => BoxShadow(
        color: Color.fromARGB(40, 0, 0, 0),
        blurRadius: 16.r,
        offset: Offset(0, 12.r),
      );
}
