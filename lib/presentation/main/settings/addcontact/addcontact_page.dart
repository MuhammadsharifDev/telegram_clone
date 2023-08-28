import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/data/model/user_contac.dart';
import 'package:telegram_clone/presentation/main/settings/bloc/setting_bloc.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingBloc, SettingState>(
      listener: (context, state) {
        if (state.status == ContactStateStatus.contactAdded) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Contact'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 40,),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'email',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'phone number',
                ),
              ),
              const SizedBox(height: 100,),
              ElevatedButton(onPressed: () {
                context.read<SettingBloc>().add(
                  AddContactEvent(contactModel: UserContact(
                   name: nameController.text,
                    email: emailController.text,
                    phoneNumber: phoneController.text, contactId: '',
                  ),),);
              }, child: const Text('ADD'),),
            ],
          ),
        ),
      ),
    );
  }
}
