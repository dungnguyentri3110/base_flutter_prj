import 'package:base_flutter_prj/core/config.dart';
import 'package:base_flutter_prj/my_app.dart';
import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MainApplycation());
}

class MainApplycation extends StatelessWidget {
  const MainApplycation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AppBloc(), child: MyApp());
  }
}


