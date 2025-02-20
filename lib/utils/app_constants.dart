class AppConstants {
  static AppConstants? instance;

  AppConstants();

  final String baseUrl = '';

  factory AppConstants.init() {
    instance ??= AppConstants();
    return instance!;
  }
}
