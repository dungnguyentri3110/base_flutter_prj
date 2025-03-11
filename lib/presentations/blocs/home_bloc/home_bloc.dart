import 'dart:developer';

import 'package:base_flutter_prj/data/remote/api_manager.dart';
import 'package:base_flutter_prj/data/repositories/example_repositories.dart';
import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_action.dart';
import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_state.dart';
import 'package:base_flutter_prj/presentations/screens/widgets/bottom_sheet_error/bottom_sheet_error.dart';
import 'package:base_flutter_prj/presentations/screens/widgets/loading/loading.dart';
import 'package:base_flutter_prj/utils/global.dart';
import 'package:base_flutter_prj/utils/translate.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeAction, HomeState> {
  HomeBloc() : super(HomeState.init()) {
    exampleRepos = getIt.get<ExampleRepositories>();
    on<GetListExample>(getListExample);
    on<GetListMusic>(getListMusic);
  }

  late ExampleRepositories exampleRepos;

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

  Future<void> getListMusic(
    GetListMusic action,
    Emitter<HomeState> emit,
  ) async {
    try {
      Loading.show();
      final response = await exampleRepos.getListMusic();
      await Future.delayed(const Duration(seconds: 3), () {
        Loading.hide();
        if (response.isNotEmpty) {
          emit(state.copy(listMusic: response));
        }
      });
    } catch (error) {
      await Future.delayed(const Duration(seconds: 3), () {
        Loading.hide();
        BottomSheetError.show(
          title: Translate.t.titleError,
          content:
              "The dimensions assume that the border is being used in a square space. When applied to a rectangular space, the border paints in the center of the rectangle",
          titleButton1: Translate.t.nextButton,
          onPress1: () {
            BottomSheetError.hide();
          },
          titleButton2: Translate.t.closeButton,
          onPress2: () {
            BottomSheetError.hide();
          },
        );
      });
      if (error is DioException) {
        log("Error music: ${error.response?.statusCode}");
      } else if (error is ApiException) {
        log("Error music: ${error.code}");
      }
    }
  }
}
