import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegram_clone/routes/routes_name.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {

        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 82,
              backgroundColor: AppColors.C_36B8B8,
              title: TextStyleModel.items(text: 'Settings', size: 18),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: media.size.height * 15 / 640,
                  ),
                  Container(
                    height: media.size.height * 80 / 640,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: Image.network(state.user!.photoURL??''),
                        ),
                        title: Text(state.user!.displayName??""),
                        subtitle: Text(state.user!.phoneNumber??''),
                      ),
                    )
                  ),
                  SizedBox(
                    height: media.size.height * 32 / 640,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.editUser);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                          'assets/svg_icons/edit_user_icon.svg'),
                      title:
                          TextStyleModel.items(text: 'Edit Profile', size: 16),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: const Icon(Icons.delete_sharp),
                      title: TextStyleModel.items(
                          text: 'Delete accaunt', size: 16),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: TextStyleModel.items(text: 'Log Out', size: 16),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
