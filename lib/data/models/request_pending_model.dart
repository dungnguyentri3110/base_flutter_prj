class RequestPendingModel<T> {
  final String url;
  final String method;
  final T Function(Object? object) fromJsonT;
  final Object? body;
  final Map<String, dynamic>? queryParameters;

  RequestPendingModel({
    required this.url,
    required this.method,
    required this.fromJsonT,
    this.body,
    this.queryParameters,
  });
}
