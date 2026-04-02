import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/app_logger.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    Log.d('Previous route: ${previousRoute?.settings.name}');
    Log.d('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    Log.d('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    Log.d('Tab route re-visited: ${route.name}');
  }

  @override
  void didStopUserGesture() {
    Log.d('User gesture stopped');
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    Log.d('User gesture started');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    Log.d('Previous route: ${oldRoute?.settings.name}');
    Log.d('Route replaced: ${newRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.d('Previous route: ${previousRoute?.settings.name}');
    Log.d('Route removed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.d('Route popped: ${route.settings.name}');
  }
}
