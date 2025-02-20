import 'package:base_flutter_prj/presentations/screens/account_screen/account_screen.dart';
import 'package:base_flutter_prj/presentations/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
};
