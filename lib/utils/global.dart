import 'package:flutter/cupertino.dart';

class GlobalApp {
  static GlobalApp? instance;

  GlobalApp();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  factory GlobalApp.init() {
    instance ??= GlobalApp();
    return instance!;
  }

  BuildContext? get appContext {
    return navigationKey.currentState?.context;
  }
}
