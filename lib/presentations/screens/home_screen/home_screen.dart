import 'dart:developer';

import 'package:base_flutter_prj/flutter_gen/app_localizations.dart';
import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_action.dart';
import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_bloc.dart';
import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_state.dart';
import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_bloc.dart';
import 'package:base_flutter_prj/presentations/screens/account_screen/account_screen.dart';
import 'package:base_flutter_prj/presentations/screens/widgets/base_page/base_page.dart';
import 'package:base_flutter_prj/presentations/screens/widgets/header/app_header.dart';
import 'package:base_flutter_prj/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeBloc(), child: _HomeScreenPage());
  }
}

class _HomeScreenPage extends StatefulWidget {
  const _HomeScreenPage({super.key});

  @override
  State<_HomeScreenPage> createState() => __HomeScreenPageState();
}

class __HomeScreenPageState extends State<_HomeScreenPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // context.read<HomeBloc>().add(GetListExample());
    log("Context: ${GlobalApp.init().appContext}");
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "HomeScreen",
      showBackIcon: false,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HomeScreen"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AccountScreen.routeName);
              },
              child: Text(AppLocalizations.of(context)!.goToAcccount),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AppBloc>().add(
                  ChangeAppLanguage(language: LanguageLocal.en),
                );
              },
              child: Text(AppLocalizations.of(context)!.goToAcccount),
            ),
          ],
        ),
      ),
    );
  }
}
