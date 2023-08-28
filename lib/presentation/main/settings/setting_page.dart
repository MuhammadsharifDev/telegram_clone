import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/presentation/main/settings/addcontact/addcontact_page.dart';
import 'package:telegram_clone/presentation/main/settings/bloc/setting_bloc.dart';
import 'package:telegram_clone/presentation/main/settings/cubit/setting_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: BlocBuilder<SettingCubit, SettingContactState>(
          builder: (context, state) {
        return state is SettingContactInSuccess
            ? ListView.separated(
          itemCount: state.contact.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<SettingBloc>().add(
                              DeleteContactEvent(
                                  contactId: state.contact[index].contactId),
                            );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.contact[index].name),
                        Text(state.contact[index].email),
                        const SizedBox(height: 10),
                      ],
                    ),
                    subtitle: Text(state.contact[index].phoneNumber),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddContact(),
            ),
          );
        },
        child: const Icon(Icons.verified_user),
      ),
    );
  }
}
