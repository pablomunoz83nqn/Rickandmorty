import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentAppConfig {
  static const _environment = String.fromEnvironment('ENV');
  static bool production = (_environment == '') ? true : false;

  static String get domainTest => dotenv.env['urlCoDevTest']!;
}
