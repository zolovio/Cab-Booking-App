import 'package:cab_booking/splash_screen.dart';
import 'package:cab_booking/src/driver/features/auth/login/login_screen.dart';
// import 'package:cab_booking/src/driver/features/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String loginScreen = '/loginScreen';
  // static const String signupScreen = '/signupScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case signupScreen:
      //   return MaterialPageRoute(builder: (_) => const SignupScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => RouteErrorScreen(
                  title: 'Route Not Found',
                  message: 'Error! The route ${settings.name} not found.',
                ));
    }
  }
}

class RouteErrorScreen extends StatelessWidget {
  final String title;
  final String message;

  const RouteErrorScreen({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
