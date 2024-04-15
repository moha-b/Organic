import 'package:flutter/material.dart';

extension BreakpointUtils on BoxConstraints {
  bool get isMobile => maxWidth <= 400;
  //bool get isLargeMobile => maxWidth < 460;
  bool get isTablet => maxWidth < 730;
  bool get isDesktop => maxWidth > 1200;
}
