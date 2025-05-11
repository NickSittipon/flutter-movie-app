import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view/home_screen.dart';
import 'package:flutter_mvvm_provider/view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
