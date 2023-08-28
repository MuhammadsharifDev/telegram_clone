import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/presentation/main/chat_page/bloc/chat_bloc.dart';
import 'package:telegram_clone/routes/routes_name.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.C_36B8B8,
              toolbarHeight: 135,
              leading: null,
              title: TextField(
                controller: _textEditingController,
                decoration: TextFormFiledModel.items(
                    color: Colors.white,
                    text: 'Search by name, number...',
                    suffixIcon: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        icon: const Icon(Icons.search_rounded))),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    bottomRight: Radius.circular(20)),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 19),
                  child: TabBar(
                    tabs: [
                      TextStyleModel.items(
                          text: 'Chats',
                          size: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      TextStyleModel.items(
                          text: 'Calls',
                          size: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ],
                    indicator: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            Column(
                              children: [
                                ListView.builder(
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 80,
                                      child: ListTile(
                                        title: Text(user!.displayName!),
                                      ),
                                    );
                                  },
                                  itemCount: 10,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('Not yet anythings'),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        );

  }
}
