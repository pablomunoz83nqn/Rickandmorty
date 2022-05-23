import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndpointPath {
  static String character = dotenv.env['epCharacter']!;
  static String location = dotenv.env['epLocation']!;
  static String episode = dotenv.env['epEpisode']!;
  static String search = dotenv.env['epSearch']!;
}
