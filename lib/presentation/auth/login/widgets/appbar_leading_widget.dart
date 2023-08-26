import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/routes/routes_name.dart';

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.splash, (route) => false);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleModel.items(text: 'Register', size: 30),
        TextStyleModel.items(
            text: 'Fill up your details to register.', size: 16),
      ],
    );
  }
}
