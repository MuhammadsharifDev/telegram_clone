import 'package:flutter/material.dart';
import 'package:telegram_clone/src/auth/login/login_page.dart';
import 'package:telegram_clone/src/routes/routes_name.dart';

sealed class AppRoutes{
  AppRoutes._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) =>  LoginPage(),
        );

    }
    return null;
  }
}