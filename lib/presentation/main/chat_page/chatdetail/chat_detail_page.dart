import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegram_clone/presentation/main/chat_page/chatdetail/widgets/appbar_title.dart';
import 'package:telegram_clone/routes/routes_name.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}



class _ChatDetailPageState extends State<ChatDetailPage> {
  List<QueryDocumentSnapshot> chats = [];
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: AppBarTitleWidget(
          name: widget.name,
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              PopupMenuButton(
                itemBuilder: (context) {
                  return List.empty();
                },
              ),
            ],
          ),
        ],
        backgroundColor: AppColors.C_36B8B8,
        toolbarHeight: media.size.height * 82 / 640,
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
              stream:
              FirebaseFirestore.instance.collection('chats').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  chats = snapshot.data!.docs.reversed.toList();
                }
                return Expanded(
                  child: ListView(),
                );
              }),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          color: Colors.grey)
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.face,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {}),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Type Something...",
                              hintStyle: TextStyle(color: Colors.blueAccent),
                              border: InputBorder.none),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.photo_camera,
                            color: Colors.blueAccent),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.attach_file,
                            color: Colors.blueAccent),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              IconButton(
                onPressed: () {
                  CollectionReference collRef =
                  FirebaseFirestore.instance.collection('chats');
                  collRef.add({
                    'chat': chatController.text,
                  });
                  chatController.clear();
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
