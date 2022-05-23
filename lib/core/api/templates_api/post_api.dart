import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/providers/http_provider.dart';
import 'package:flutter_application_1/data/models/http_model.dart';

class PostApi {
  static Future<Response> responseModel(RequestBaseModel request,
      [Dio? dio]) async {
    return await HttpServiceProvider(dio).post(request);
  }

  static Future<Response?> responseModelNullableCatch(
    RequestBaseModel request, {
    Dio? dio,
    List<int> expectErrorCodes = const [],
  }) async {
    try {
      return await HttpServiceProvider(dio).post(request);
    } on DioError catch (e) {
      if (expectErrorCodes.contains(e.response?.statusCode)) {
        return e.response;
      } else {
        return null;
      }
    }
  }

  static Future<Response?> responseModelNullable(RequestBaseModel request,
      [Dio? dio]) async {
    try {
      return await HttpServiceProvider(dio).post(request);
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> map(RequestBaseModel request,
          [Dio? dio]) async =>
      await HttpSerializableProvider<Map<String, dynamic>>(dio).post(request) ??
      {};

  static Future<List<dynamic>> list(RequestBaseModel request,
          [Dio? dio]) async =>
      await HttpSerializableProvider<List<dynamic>>(dio).post(request) ?? [];
}
