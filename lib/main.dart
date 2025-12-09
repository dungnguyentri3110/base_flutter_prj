import 'package:base_flutter_prj/core/config.dart';
import 'package:base_flutter_prj/presentations/app_flow/my_app.dart';
import 'package:base_flutter_prj/presentations/app_flow/app_bloc/app_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('vi')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('vi'),
      startLocale: Locale('vi'),
      child: MainApplycation(),
    ),
  );
}

class MainApplycation extends StatelessWidget {
  const MainApplycation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AppBloc(), child: MyApp());
  }
}
