import 'package:flutter/material.dart';

import 'package:gallery/presentation/main/main_view.dart';
import 'package:gallery/resources/strings_manager.dart';
import '../app/di.dart';
import '../presentation/pages_auth/login/view/login_view.dart';
import '../presentation/pages_home_jobs/home_screen/home_screen_view.dart';



class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "login";
  static const String onBoardingRoute = "onBoarding";
  static const String mainRoute = "main";
  static const String Route = "No";
  static const String HomeScreenViewRoute = "HomeScreenView";
  static const String HomeScreenFilter = "HomeScreenFilter";



// static const String Route = "No";
}
class ScreenArguments {
  final String id;
  ScreenArguments(this.id);
}
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.HomeScreenViewRoute:
        initLoginModule();
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreenView();
          },
        );

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (context) => MainView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(
            child: Text(AppStrings.noRouteFound),
          ),
        );
      },
    );
  }
}
