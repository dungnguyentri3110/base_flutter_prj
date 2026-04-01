import 'package:auto_route/auto_route.dart';
import 'package:base_flutter_prj/navigations/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: "/login_route", page: LoginRoute.page, initial: true),
    AutoRoute(path: "/sign_up_route", page: SignUpRoute.page),
  ];
}
