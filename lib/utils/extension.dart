import 'package:base_flutter_prj/flutter_gen/app_localizations.dart';
import 'package:base_flutter_prj/utils/global.dart';
import 'package:flutter/material.dart';

extension SizeContext on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }

  EdgeInsets get safeAreaSize {
    return MediaQuery.of(this).padding;
  }
}
