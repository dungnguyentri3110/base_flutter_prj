import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

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
