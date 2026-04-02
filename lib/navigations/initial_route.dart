import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter_prj/navigations/routes.gr.dart';
import 'package:base_flutter_prj/storages/share_preferences.dart';
import 'package:base_flutter_prj/utils/extension.dart';

import '../core/config.dart';

class InitialRoute implements AutoRouteGuard {
  @override
  FutureOr<void> onNavigation(NavigationResolver resolver, StackRouter router) {
    final passed = getAlreadyPassIntro().isNullOrEmpty;
    if (passed) {
      resolver.next(true);
    } else {
      router.replace(LoginRoute());
    }
  }

  String? getAlreadyPassIntro() {
    final share = getIt<SharePreferences>();
    return share.getData("intro");
  }
}
