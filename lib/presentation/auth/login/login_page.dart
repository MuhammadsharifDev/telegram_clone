import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/bottomstyle/bottomstyle_widget.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/presentation/auth/login/bloc/login_bloc.dart';
import 'package:telegram_clone/presentation/main/main_page.dart';
import 'package:telegram_clone/routes/routes_name.dart';

import 'widgets/appbar_leading_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MainPage();
              } else {
                return Scaffold(
                  appBar: AppBar(
                    title: const TitleWidget(),
                    leading: null,
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
                                return 'Enter your email';
                              }
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: TextFormFiledModel.items(
                                text: 'Enter your email'),
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
                                    context.read<LoginBloc>().add(VisibleEvent(
                                        isVisible: !state.visibleIcon));
                                  },
                                  icon: Icon(state.visibleIcon
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                            ),
                          ),
                          SizedBox(
                            height: media.size.height * 50 / 640,
                          ),
                          ElevatedButton(
                            style: BottomStyleModel.item(),
                            onPressed: () {
                              context.read<LoginBloc>().add(SignInEvent(
                                  password: passwordController.text,
                                  email: emailController.text));
                            },
                            child:
                                TextStyleModel.items(text: 'Login', size: 15),
                          ),
                          SizedBox(
                            height: media.size.height * 20 / 640,
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<LoginBloc>()
                                  .add(RegstrWithGoogleEvent());
                            },
                            child: Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/png_images/google_image.png'),
                                    ),
                                    TextStyleModel.items(
                                        text: 'Regstr with Google', size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextStyleModel.items(
                                  text: 'Do not  have an account',
                                  size: 12,
                                  color: Colors.black),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.signupPage);
                                },
                                child: TextStyleModel.items(
                                    text: 'Regstr',
                                    size: 12,
                                    color: AppColors.C_36B8B8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            });
      },
    );
  }
}
