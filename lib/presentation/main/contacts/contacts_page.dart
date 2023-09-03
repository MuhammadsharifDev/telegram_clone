import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/bottomstyle/bottomstyle_widget.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/presentation/main/contacts/contact_page_mixin.dart';
import 'package:telegram_clone/routes/routes_name.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> with ContactsPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 82,
        backgroundColor: AppColors.C_36B8B8,
        automaticallyImplyLeading: false,
        title: TextStyleModel.items(text: 'New Message', size: 18),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              List<ListTile> userWidgets = [];
              if (snapshot.hasData) {
                final users = snapshot.data?.docs.reversed.toList();
                for (var user in users!) {
                  final userWidget = ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                  );
                  userWidgets.add(userWidget);
                }
              }
              return Expanded(
                  child: ListView(
                children: List.generate(
                    userWidgets.length, (index) => userWidgets[index]),
              ));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: TextFormFiledModel.items(text: 'name'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: TextFormFiledModel.items(text: 'phone'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          style: BottomStyleModel.item(),
                          onPressed: () {
                            CollectionReference collRef =
                                FirebaseFirestore.instance.collection('users');
                            collRef.add({
                              'name': nameController.text,
                              'email': emailController.text,
                            });
                            nameController.clear();
                            emailController.clear();
                          },
                          child: const Text('Add User'),),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
