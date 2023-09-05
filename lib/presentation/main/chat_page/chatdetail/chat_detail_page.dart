import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegram_clone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/presentation/main/chat_page/chatdetail/widgets/appbar-action_widget.dart';
import 'package:telegram_clone/presentation/main/chat_page/chatdetail/widgets/appbar_title.dart';
import 'package:telegram_clone/presentation/main/chat_page/chatservice/chat_service.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage(
      {super.key,
      required this.name,
      required this.recerverUserEamil,
      required this.recerverUserId});

  final String recerverUserEamil;
  final String recerverUserId;
  final String name;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController messageController = TextEditingController();
  final _chatService = ChatService();
  List<QueryDocumentSnapshot> chats = [];

  Future<void> sendMessaga() async {
    if (messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.recerverUserId, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: AppBarTitleWidget(
          name: widget.name,
        ),
        actions: const [
          AppBarActionWidget(),
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
          //message
          Expanded(
            child: _builtMessageList(),
          ),
          //user input
          _builtMessageInput(),
          //
        ],
      ),
    );
  }

  //built message list
  Widget _builtMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessage(
          widget.recerverUserId, FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error==>${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  //built message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var aligment = (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: aligment,
      child: Column(
        crossAxisAlignment:
            (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
        mainAxisAlignment:
            (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
        children: [
          Text(data['senderEmail']),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
            child: Text(data['message']),
          )
        ],
      ),
    );
  }

//built message input
  Widget _builtMessageInput() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: messageController,
            decoration: TextFormFiledModel.items(text: 'Send your message'),
          ),
        ),
        IconButton(
          onPressed: sendMessaga,
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
