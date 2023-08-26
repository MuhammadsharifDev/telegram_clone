import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/utils/app_images.dart';
import 'package:telegram_clone/presentation/splash/splash_bloc.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashInitEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashEndedState) {
            Navigator.pushReplacementNamed(context, state.route);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.C_36B8B8,
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppImages.splash_image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
