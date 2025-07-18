import 'package:base_flutter_prj/presentations/app_flow/app_bloc/app_state.dart';

abstract class AppAction {}

class ChangeAppLanguage extends AppAction {
  final LanguageLocal language;

  ChangeAppLanguage({required this.language});
}
