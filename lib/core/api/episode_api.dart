import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api/templates_api/get_api.dart';
import 'package:flutter_application_1/core/paths/endpoint_paths.dart';
import 'package:flutter_application_1/data/models/episode/episode_model.dart';
import 'package:flutter_application_1/data/models/http_model.dart';
import 'package:flutter_application_1/gui/views/episode_view/character_view_store.dart';

class EpisodeApi {
  static Future<EpisodeModel?> getEpisode(
      {Dio? dio, String endPointTest = ''}) async {
    String endPoint = endPointTest.isNotEmpty
        ? endPointTest
        : EndpointPath.episode +
            '/?page=' +
            StoreEpisodeView().range.toString();
    final request = RequestBaseModel(
      domain: 'https://rickandmortyapi.com',
      endpoint: endPoint,
    );

    Map<String, dynamic> response = await GetApi.map(request, dio);
    return (response.isNotEmpty) ? EpisodeModel.fromJson(response) : null;
  }
}
