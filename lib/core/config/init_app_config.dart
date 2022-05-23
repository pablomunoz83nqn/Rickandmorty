import 'package:flutter_application_1/core/paths/dotenv.paths.dart';

Future<void> initAppConfig() async {
  await DotEnvAppPath.load();
}
