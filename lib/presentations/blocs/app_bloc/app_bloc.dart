import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_action.dart';
import 'package:base_flutter_prj/presentations/blocs/app_bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  AppBloc() : super(AppState.init()) {
    on<ChangeAppLanguage>(changeAppLanguage);
  }

  void changeAppLanguage(ChangeAppLanguage action, Emitter<AppState> emit) {
    emit(state.copy(language: action.language));
  }
}
