import 'package:flutter/material.dart';
import 'package:mvc_bolierplate_getx/feature/home/view/home.dart';

import '../../feature/log_in/view/login_screen.dart';
import '../../feature/log_in/view/send-verification-mail.dart';

abstract class RouteName {
  static const loginScreen = '/login';
  static const homeScreen = '/home';
  static const sendVerificationScreen = 'send-verification-mail.dart';

  RouteName._();
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = settings.name;

    if (route == RouteName.sendVerificationScreen) {
      return MaterialPageRoute(
        builder: (BuildContext context) => SendVerificationMailScreen(),
      );
    }
    if (route == RouteName.loginScreen) {
      return MaterialPageRoute(
        builder: (
          BuildContext context,
        ) =>
            LoginScreen(),
      );
    } else if (route == RouteName.homeScreen) {
      return MaterialPageRoute(
        builder: (
          BuildContext context,
        ) =>
            const HomePage(),
      );
    } else {
      return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              LoginScreen());
    }
  }
}
