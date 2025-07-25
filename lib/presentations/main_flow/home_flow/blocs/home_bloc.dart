import 'package:base_flutter_prj/domain/usecases/example_usecase.dart';
import 'package:base_flutter_prj/presentations/main_flow/home_flow/blocs/home_state.dart';
import 'package:base_flutter_prj/utils/app_logger.dart';
import 'package:base_flutter_prj/utils/global.dart';
import 'package:base_flutter_prj/widgets/loading/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.init());

  final ExampleUsecase _exampleUsecase = getIt<ExampleUsecase>();

  Future<void> getListMusic() async {
    Loading.show();
    final response = await _exampleUsecase.getListMusic();
    Log.d(response);
    response.fold(
      (error) async {
        Log.d(error);
        await Future.delayed(const Duration(seconds: 3), () {
          Loading.hide();
          // BottomSheetError.show(
          //   title: Translate.t.titleError,
          //   content:
          //       "The dimensions assume that the border is being used in a square space. When applied to a rectangular space, the border paints in the center of the rectangle",
          //   titleButton1: Translate.t.nextButton,
          //   onPress1: () {
          //     BottomSheetError.hide();
          //   },
          //   titleButton2: Translate.t.closeButton,
          //   onPress2: () {
          //     BottomSheetError.hide();
          //   },
          // );
        });
      },
      (res) {
        Log.d(res);
        emit(state.copy(listMusic: res.data));
      },
    );
    Loading.hide();
  }
}
