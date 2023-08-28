import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/presentation/auth/login/bloc/login_bloc.dart';
import 'package:telegram_clone/presentation/auth/login/login_page.dart';
import 'package:telegram_clone/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:telegram_clone/presentation/auth/signup/sign_up_page.dart';
import 'package:telegram_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegram_clone/presentation/main/chat_page/bloc/chat_bloc.dart';
import 'package:telegram_clone/presentation/main/chat_page/chat_page.dart';
import 'package:telegram_clone/presentation/main/chat_page/chatdetail/chat_detail_page.dart';
import 'package:telegram_clone/presentation/main/main_page.dart';
import 'package:telegram_clone/presentation/onboarding/bloc/onboard_bloc.dart';
import 'package:telegram_clone/presentation/onboarding/onboarding_page.dart';
import 'package:telegram_clone/presentation/splash/splash_bloc.dart';
import 'package:telegram_clone/presentation/splash/splash_page.dart';
import 'package:telegram_clone/routes/routes_name.dart';

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashBloc()..add(SplashInitEvent()),
            child: const SplashPage(),
          ),
        );
      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnboardBloc()..add(PageViewEvent()),
            child: const OnboardingPage(),
          ),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginPage(),
          ),
        );
      case RoutesName.main:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MainBloc(),
            child: const MainPage(),
          ),
        );
      case RoutesName.detailChatPage:
        return MaterialPageRoute(
          builder: (context) => const ChatDetailPage(),
        );
      case RoutesName.signupPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupBloc(),
            child: SignupPage(),
          ),
        );

    }
    return null;
  }
}
