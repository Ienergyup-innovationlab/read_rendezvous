import 'package:book_app/features/auth/presentation/ui/login.dart';
import 'package:book_app/features/auth/presentation/ui/signup.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(LoginView());

      case '/Login':
        return _materialRoute(LoginView());

      case '/Signup':
        return _materialRoute(SignupView());

      default:
        return _materialRoute(LoginView());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
