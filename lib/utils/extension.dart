import 'package:flutter/material.dart';

extension SizeContext on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }

  EdgeInsets get safeAreaSize {
    return MediaQuery.of(this).padding;
  }
}

extension StringNull on String? {
  bool get isNull {
    return this == null;
  }
}

extension StringNullOrEmpty on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}

extension ListNullOrEmpty on List? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
