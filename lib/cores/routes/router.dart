import 'package:flutter/material.dart';
import 'package:project3/features/auth/presentation/pages/login_page.dart';
import 'package:project3/features/auth/presentation/pages/register_page.dart';
import 'package:project3/features/auth/presentation/pages/login_wall_page.dart';
import 'package:project3/features/auth/presentation/pages/splash_page.dart';
import 'package:project3/features/home/presentation/pages/homes_page.dart';

class Routes {
  const Routes._();

  static const String root = '/';
  static const String loginWall = '/loginWall';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
}

class AppRouter extends MaterialPageRoute<void> {
  AppRouter({
    required RouteSettings routeSettings,
  }) : super(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case Routes.root:
                return const SplashPage();
              case Routes.loginWall:
                return const LoginWallPage();
              case Routes.login:
                return const LoginPage();
              case Routes.register:
                return const RegisterPage();
              case Routes.home:
                return const HomePage();
              default:
                return const NotFoundPage();
            }
          },
        );
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
