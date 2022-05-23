import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api/character_api.dart';
import 'package:flutter_application_1/core/config/environment_config.dart';
import 'package:flutter_application_1/core/paths/dotenv.paths.dart';
import 'package:flutter_application_1/core/paths/endpoint_paths.dart';
import 'package:flutter_application_1/data/models/character/character_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

String _url = '';
void main() async {
  await DotEnvAppPath.initTest();
  _url = EnvironmentAppConfig.domainTest;
  get();
}

void get() async {
  test('Get Character, CharacterApi.getCharacter', () async {
    String endPoint = EndpointPath.character + '/?page=' + '1';

    final File file = File('test/json_files/character/character_response.json');
    String responseRaw = await file.readAsString();
    Map<String, dynamic> responseMap = json.decode(responseRaw);

    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    dioAdapter.onGet(_url + endPoint, (server) {
      server.reply(200, responseMap);
    });

    final dataModelExpect = CharacterModel.fromJson(responseMap);
    final dataModelResponse =
        await CharacterApi.getCharacter(dio: dio, endPointTest: endPoint);

    expect(dataModelResponse!.info!.pages, dataModelExpect.info!.pages);

    expect(
      dataModelResponse.results.length,
      dataModelExpect.results.length,
    );
  });
}
