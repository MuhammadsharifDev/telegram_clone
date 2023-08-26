import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/presentation/auth/login/bloc/login_bloc.dart';
import 'package:telegram_clone/routes/routes_name.dart';

import 'widgets/appbar_leading_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isUserSignIn == true) {
          Navigator.pushNamed(context, RoutesName.main);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const TitleWidget(),
            leading: const LeadingWidget(),
            shape: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.C_36B8B8),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            toolbarHeight: media.size.height * 200 / 640,
            backgroundColor: AppColors.C_36B8B8,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: media.size.height * 36 / 640,
                  ),
                  SizedBox(
                    height: media.size.height * 24 / 640,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your user';
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        TextFormFiledModel.items(text: 'Enter your email'),
                  ),
                  SizedBox(
                    height: media.size.height * 24 / 640,
                  ),
                  TextFormField(
                    obscureText: state.visibleIcon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: TextFormFiledModel.items(
                      text: 'Enter your password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                VisibleEvent(isVisible: !state.visibleIcon));
                          },
                          icon: Icon(state.visibleIcon
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                  ),
                  SizedBox(
                    height: media.size.height * 68 / 640,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 55),
                          backgroundColor: AppColors.C_36B8B8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                      onPressed: () {
                        context.read<LoginBloc>().add(SignInEvent(
                            password: passwordController.text,
                            email: emailController.text));
                      },
                      child: TextStyleModel.items(text: 'Login', size: 15)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
