import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api/templates_api/get_api.dart';
import 'package:flutter_application_1/core/paths/endpoint_paths.dart';
import 'package:flutter_application_1/data/models/character/character_model.dart';
import 'package:flutter_application_1/data/models/http_model.dart';
import 'package:flutter_application_1/gui/views/character_view/character_view_store.dart';

class CharacterApi {
  static Future<CharacterModel?> getCharacter(
      {Dio? dio, String endPointTest = ''}) async {
    String endPoint = endPointTest.isEmpty
        ? EndpointPath.character +
            '/?page=' +
            StoreCharacterView().range.toString()
        : endPointTest;
    final request = RequestBaseModel(
      domain: 'https://rickandmortyapi.com',
      endpoint: endPoint,
    );

    Map<String, dynamic> response = await GetApi.map(request, dio);
    return (response.isNotEmpty) ? CharacterModel.fromJson(response) : null;
  }

  static Future<CharacterModel?> getCharacterSearch({
    Dio? dio,
  }) async {
    final request = RequestBaseModel(
      domain: 'https://rickandmortyapi.com',
      endpoint: EndpointPath.character,
    );

    Map<String, dynamic> response = await GetApi.map(request, dio);
    return (response.isNotEmpty) ? CharacterModel.fromJson(response) : null;
  }
}
