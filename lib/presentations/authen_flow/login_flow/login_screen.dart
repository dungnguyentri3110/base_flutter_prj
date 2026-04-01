import 'package:auto_route/auto_route.dart';
import 'package:base_flutter_prj/navigations/routes.gr.dart';
import 'package:base_flutter_prj/widgets/base_button/base_button.dart';
import 'package:base_flutter_prj/widgets/base_page/base_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showBackIcon: false,
      title: "login.title".tr(),
      child: Column(
        children: [
          BaseButton.outline(
            onPress: () {
              context.navigateTo(const SignUpRoute());
            },
            titleButton: "Go to SignUp",
          ),
        ],
      ),
    );
  }
}
