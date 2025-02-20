import 'package:dio/dio.dart';

class ApiManager {
  static ApiManager? instance;
  final Dio dio;

  ApiManager({required this.dio});

  factory ApiManager.init() {
    instance ??= ApiManager(
      dio: Dio(
        BaseOptions(
          baseUrl: '',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      ),
    );
    return instance!;
  }

  void configureDio() {
    dio.interceptors.add(CustomInterceptors());
  }
}

class CustomInterceptors implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final error = err.copyWith(
      error: CustomError(requestOptions: err.requestOptions),
    );
    handler.reject(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.resolve(response);
  }
}

// Custom error enum here
class CustomError extends DioException {
  CustomError({required super.requestOptions});

  ErrorCode get errorCode {
    switch (response?.statusCode) {
      case 400:
        return ErrorCode.badRequest;
      default:
        return ErrorCode.serverNotResponse;
    }
  }
}

enum ErrorCode { notFound, badRequest, serverNotResponse, timeout }

extension ErrorValue on ErrorCode {
  int get value {
    switch (this) {
      case ErrorCode.badRequest:
        return 400;
      default:
        return 200;
    }
  }
}
