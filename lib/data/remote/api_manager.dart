import 'package:dio/dio.dart';

class ApiManager {
  static ApiManager? instance;
  final Dio dio;

  ApiManager({required this.dio});

  factory ApiManager.init() {
    instance ??= ApiManager(
      dio: Dio(
        BaseOptions(
          baseUrl: 'http://10.86.35.93:3000/',
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
      case 404:
        return ErrorCode.notFound;
      default:
        return ErrorCode.serverNotResponse;
    }
  }
}

enum ErrorCode { notFound, badRequest, serverNotResponse, timeout, success }

extension ErrorValue on ErrorCode {
  int get value {
    switch (this) {
      case ErrorCode.badRequest:
        return 400;
      case ErrorCode.success:
        return 200;
      default:
        return 200;
    }
  }
}

class ApiException implements Exception {
  final int? code;
  final String? message;

  ApiException({this.code, this.message});
}
