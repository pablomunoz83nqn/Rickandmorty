import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/providers/http_provider.dart';
import 'package:flutter_application_1/data/models/http_model.dart';

class DeleteApi {
  static Future<Response> responseModel(RequestBaseModel request,
      [Dio? dio]) async {
    return await HttpServiceProvider(dio).delete(request);
  }

  static Future<Response?> responseModelNullable(RequestBaseModel request,
      [Dio? dio]) async {
    try {
      return await HttpServiceProvider(dio).delete(request);
    } catch (e) {
      return null;
    }
  }
}
