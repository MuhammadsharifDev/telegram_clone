import 'package:flutter/material.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/utils/app_images.dart';
import 'package:telegram_clone/routes/routes_name.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, RoutesName.onboarding));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_36B8B8,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          AppImages.splash_image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
