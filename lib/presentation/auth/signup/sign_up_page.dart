import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/bottomstyle/bottomstyle_widget.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:telegram_clone/presentation/main/main_page.dart';
import 'package:telegram_clone/routes/routes_name.dart';

part 'package:telegram_clone/presentation/auth/signup/sign_up_page_mixin.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with SignUpPageMixin {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MainPage();
              } else {
                return Scaffold(
                  appBar: AppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleModel.items(text: 'Register', size: 30),
                        TextStyleModel.items(
                            text: 'Fill up your details to register.',
                            size: 16),
                      ],
                    ),
                    backgroundColor: AppColors.C_36B8B8,
                    toolbarHeight: 200,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: media.size.height * 36 / 640,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your user';
                              }
                            },
                            controller: userController,
                            keyboardType: TextInputType.name,
                            decoration: TextFormFiledModel.items(
                                text: 'Enter your user'),
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your password';
                              }
                            },
                            controller: phoneNumberController,
                            obscureText: state.visibleIcon,
                            keyboardType: TextInputType.text,
                            decoration: TextFormFiledModel.items(
                              text: 'Enter your password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context.read<SignupBloc>().add(
                                        VisibleIconEvent(
                                            isVisible: !state.visibleIcon),
                                      );
                                },
                                icon: Icon(state.visibleIcon
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: media.size.height * 68 / 640,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<SignupBloc>().add(
                                    SignUpEvent(
                                      password: phoneNumberController.text,
                                      email: emailController.text,
                                      name: userController.text,
                                      phoneNumber: phoneNumberController.text,
                                    ),
                                  );
                            },
                            style: BottomStyleModel.item(),
                            child:
                                TextStyleModel.items(text: 'Regstr', size: 18),
                          ),
                          SizedBox(
                            height: media.size.height * 20 / 640,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextStyleModel.items(
                                  text: 'Already have an account',
                                  size: 18,
                                  color: Colors.black),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.login);
                                },
                                child: TextStyleModel.items(
                                    text: 'Login',
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
