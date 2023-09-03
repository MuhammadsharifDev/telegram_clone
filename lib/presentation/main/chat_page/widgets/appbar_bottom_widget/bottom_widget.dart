import 'package:flutter/material.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
