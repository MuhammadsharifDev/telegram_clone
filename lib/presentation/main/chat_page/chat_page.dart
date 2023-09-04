import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegram_clone/presentation/main/chat_page/widgets/user_item_widget.dart';
import 'package:telegram_clone/routes/routes_name.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<QueryDocumentSnapshot> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.C_36B8B8,
        toolbarHeight: 135,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _textEditingController,
          decoration: TextFormFiledModel.items(
              color: Colors.white,
              text: 'Search by name, number...',
              prefixIcon: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child:
                          Text(state.user!.displayName![0].toUpperCase() ?? ''),
                    ),
                  );
                },
              ),
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded))),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                20,
              ),
              bottomRight: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                users = snapshot.data!.docs.reversed.toList();
              }else{
                return const Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView(
                  children: List.generate(
                    users.length,
                    (index) => ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesName.chatDetailPage,arguments: users[index]['name']);
                      },
                      leading: const CircleAvatar(),
                      title: Text(users[index]['name']),
                      subtitle: Text(users[index]['email']),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
