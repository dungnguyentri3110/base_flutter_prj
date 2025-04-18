import 'package:base_flutter_prj/gen/language/app_localizations.dart';
import 'package:base_flutter_prj/utils/global.dart';

class Translate {
  static AppLocalizations get t {
    return AppLocalizations.of(GlobalApp.init().appContext!)!;
  }
}
