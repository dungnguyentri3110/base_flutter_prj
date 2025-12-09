import 'package:equatable/equatable.dart';

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

class AppState extends Equatable{
  final LanguageLocal? language;

  const AppState({this.language});

  factory AppState.init() {
    return AppState(language: LanguageLocal.vi);
  }

  AppState copy({LanguageLocal? language}) {
    return AppState(language: language ?? this.language);
  }
  
  @override
  List<Object?> get props => [language];
}
