import 'package:flutter/material.dart';

extension SizeContext on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }

  EdgeInsets get safeAreaSize {
    return MediaQuery.of(this).padding;
  }
}
