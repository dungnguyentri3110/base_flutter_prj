class BaseResponse<T> {
  dynamic errorCode;
  T? data;
  String? message;
  bool? success;

  BaseResponse({this.errorCode, this.data, this.message, this.success});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? object)? fromJsonT,
  ) {
    return BaseResponse<T>(
      errorCode: json['errorCode'],
      message: json['message'],
      data: fromJsonT?.call(json['data']),
      success: json['success'],
    );
  }
}
