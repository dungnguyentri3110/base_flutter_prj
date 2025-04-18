import 'package:base_flutter_prj/data/remote/api_manager.dart';
import 'package:base_flutter_prj/gen/language/app_localizations.dart';
import 'package:base_flutter_prj/navigations/routes.dart';
import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_bloc.dart';
import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_state.dart';
import 'package:base_flutter_prj/presentations/screens/home_screen/home_screen.dart';
import 'package:base_flutter_prj/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialApp();
  }

  void initialApp() {
    GlobalApp.init();
    final apiManager = getIt<ApiManager>();
    apiManager.configureDio();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: routes,
              initialRoute: HomeScreen.routeName,
              navigatorKey: GlobalApp.instance?.navigationKey,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(state.language!.value),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                fontFamily: 'SF-Pro-Display',
              ),
            );
          },
        );
      },
    );
  }
}
