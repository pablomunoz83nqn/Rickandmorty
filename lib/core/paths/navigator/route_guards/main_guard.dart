import 'package:auto_route/auto_route.dart';

class MainGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    router.replaceNamed("/entrance");
  }
}
