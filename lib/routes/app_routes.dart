import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/presentation/auth/login/bloc/login_bloc.dart';
import 'package:telegram_clone/presentation/auth/login/login_page.dart';
import 'package:telegram_clone/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:telegram_clone/presentation/auth/signup/sign_up_page.dart';
import 'package:telegram_clone/presentation/main/chat_page/chatdetail/chat_detail_page.dart';
import 'package:telegram_clone/presentation/main/contacts/contacts_page.dart';
import 'package:telegram_clone/presentation/main/main_page.dart';
import 'package:telegram_clone/presentation/main/settings/edit_user/edit_user_page.dart';
import 'package:telegram_clone/presentation/main/settings/setting_page.dart';
import 'package:telegram_clone/presentation/onboarding/bloc/onboard_bloc.dart';
import 'package:telegram_clone/presentation/onboarding/onboarding_page.dart';
import 'package:telegram_clone/presentation/splash/splash_page.dart';
import 'package:telegram_clone/routes/routes_name.dart';

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
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
          builder: (context) => MainPage(),
        );
      case RoutesName.chatDetailPage:
        return MaterialPageRoute(
          builder: (context) => ChatDetailPage(
            name: settings.arguments as String,
            recerverUserEamil: settings.arguments as String,
            recerverUserId: settings.arguments as String,
          ),
        );
      case RoutesName.signupPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupBloc(),
            child: SignupPage(),
          ),
        );
      case RoutesName.editUser:
        return MaterialPageRoute(
          builder: (context) => EditUserPage(),
        );

      case RoutesName.settingPage:
        return MaterialPageRoute(
          builder: (context) => const SettingPage(),
        );
      case RoutesName.contactsPage:
        return MaterialPageRoute(
          builder: (context) => const ContactsPage(),
        );
    }
    return null;
  }
}
