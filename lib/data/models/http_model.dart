class RequestBaseModel {
  final String body;
  final String domain;
  final String endpoint;
  final String urlParam;
  final Map<String, String> headers;
  final Map<String, String>? queryParameters;

  RequestBaseModel({
    this.body = '',
    this.domain = '',
    this.endpoint = '',
    this.urlParam = '',
    this.headers = const {},
    this.queryParameters,
  });

  RequestBaseModel copyWith(
    String? body,
    String? domain,
    String? endpoint,
    String? urlParam,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  ) =>
      RequestBaseModel(
        body: body ?? this.body,
        domain: domain ?? this.domain,
        endpoint: endpoint ?? this.endpoint,
        urlParam: urlParam ?? this.urlParam,
        headers: headers ?? this.headers,
        queryParameters: queryParameters ?? this.queryParameters,
      );
}
