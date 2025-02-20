enum LanguageLocal { vi, en }

extension LanguageLocalValue on LanguageLocal {
  String get value {
    if (LanguageLocal.vi == this) {
      return 'vi';
    } else {
      return 'en';
    }
  }
}

class AppState {
  final LanguageLocal? language;

  AppState({this.language});

  factory AppState.init() {
    return AppState(language: LanguageLocal.vi);
  }

  AppState copy({LanguageLocal? language}) {
    return AppState(language: language ?? this.language);
  }
}
