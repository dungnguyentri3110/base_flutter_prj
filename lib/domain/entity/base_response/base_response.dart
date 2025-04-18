class BaseResponse<T> {
  int? code;
  T? data;
  String? message;

  BaseResponse({this.code, this.data, this.message});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? object) fromJsonT,
  ) {
    return BaseResponse<T>(
      code: json['status'],
      message: json['message'],
      data: fromJsonT(json['data'])
    );
  }
}
