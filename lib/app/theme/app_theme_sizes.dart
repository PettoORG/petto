import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemeSpacing {
  static const double extraTiny = 0.01; // 1%
  static const double tiny = 0.015; // 1,5%
  static const double extraSmall = 0.02; // 2%
  static const double small = 0.04; // 4%
  static const double medium = 0.06; // 6%
  static const double large = 0.08; // 8%
  static const double extraLarge = 0.10; // 10%
  static const double doubleXL = 0.12; // 12%
  static const double tripleXL = 0.15; // 15%
  static const double ultra = 0.20; // 20%
}

class AppThemeRadius {
  static const Radius small = Radius.circular(8);
  static const Radius medium = Radius.circular(12);
  static const Radius large = Radius.circular(16);
  static const Radius extraLarge = Radius.circular(24);
  static const Radius doubleXL = Radius.circular(32);
  static const Radius tripleXL = Radius.circular(48);
}

class AppThemeShadow {
  static const BoxShadow small = BoxShadow(
    color: Color.fromARGB(10, 0, 0, 0),
    blurRadius: 4,
    offset: Offset(0, 2),
  );
  static const BoxShadow medium = BoxShadow(
    color: Color.fromARGB(20, 0, 0, 0),
    blurRadius: 8,
    offset: Offset(0, 4),
  );
  static const BoxShadow large = BoxShadow(
    color: Color.fromARGB(30, 0, 0, 0),
    blurRadius: 12,
    offset: Offset(0, 8),
  );
  static const BoxShadow extraLarge = BoxShadow(
    color: Color.fromARGB(40, 0, 0, 0),
    blurRadius: 16,
    offset: Offset(0, 12),
  );
}
