import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/presentation/onboarding/bloc/onboard_bloc.dart';
import 'package:telegram_clone/routes/routes_name.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(70, 30),
                    backgroundColor: AppColors.C_36B8B8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Center(
                    child: TextStyleModel.items(text: 'Skip', size: 10))),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<OnboardBloc, OnboardState>(
          builder: (context, state) {
            return PageView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: media.size.height * 285 / 640,
                        width: media.size.width * 285 / 360,
                        child: Image.asset(state.items[index].image),
                      ),
                      Text(
                        state.items[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xD8191919),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 60,),
                    index==state.items.length-1?Text('S'):Text('kkkk'),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
