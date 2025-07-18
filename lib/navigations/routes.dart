import 'package:base_flutter_prj/presentations/authen_flow/account_flow/account_screen.dart';
import 'package:base_flutter_prj/presentations/main_flow/home_flow/home_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
};
