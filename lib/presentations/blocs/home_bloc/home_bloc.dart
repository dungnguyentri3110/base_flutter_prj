import 'dart:developer';

import 'package:base_flutter_prj/data/remote/api_manager.dart';
import 'package:base_flutter_prj/data/remote/retrofits/example_request.dart';
import 'package:base_flutter_prj/data/repositories/example_repositories.dart';
import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_action.dart';
import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeAction, HomeState> {
  HomeBloc() : super(HomeState.init()) {
    on<GetListExample>(getListExample);
  }

  final exampleRepos = ExampleRepositories(
    api: ExampleClient(ApiManager.init().dio),
  );

  Future<void> getListExample(
    GetListExample action,
    Emitter<HomeState> emit,
  ) async {
    try {
      final response = await exampleRepos.getListExample();
    } on DioException catch (error) {
      log("Error: ${error}");
    }
  }
}
