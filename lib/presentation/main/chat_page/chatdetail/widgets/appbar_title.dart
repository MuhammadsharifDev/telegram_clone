import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/presentation/main/bloc/main_bloc.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key,required this.name,});
 final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return CircleAvatar(
              child: state.user?.photoURL != null
                  ? Image.network(state.user!.photoURL!)
                  : Image.asset('assets/png_images/onboarding.png'),
            );
          },
        ),
        const SizedBox(
          width: 5,
        ),
        BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Text(name);
          },
        ),
      ],
    );
  }
}
