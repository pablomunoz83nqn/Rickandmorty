import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/providers/http_provider.dart';
import 'package:flutter_application_1/data/models/http_model.dart';

class GetApi {
  static Future<Response> responseModel(RequestBaseModel request,
          [Dio? dio]) async =>
      await HttpServiceProvider(dio).get(request);

  static Future<Response?> responseModelNullable(RequestBaseModel request,
      [Dio? dio]) async {
    try {
      return await HttpServiceProvider(dio).get(request);
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> map(RequestBaseModel request,
          [Dio? dio]) async =>
      await HttpSerializableProvider<Map<String, dynamic>>(dio).get(request) ??
      {};

  static Future<List<dynamic>> list(RequestBaseModel request,
      [Dio? dio]) async {
    List<dynamic>? response =
        await HttpSerializableProvider<List<dynamic>>(dio).get(request);

    return response ?? [];
  }
}
