import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocalAppPaths {
  static String onboarding1 = dotenv.env['imgOnboarding1']!;
  static String onboarding2 = dotenv.env['imgOnboarding2']!;
  static String onboarding3 = dotenv.env['imgOnboarding3']!;
  static String image404 = dotenv.env['image404']!;
  static String empty = dotenv.env['empty']!;
  static String imgPinMap = dotenv.env['imgPinMap']!;
  static String imgLogo = dotenv.env['imgLogo']!;
}
