import 'package:flutter/material.dart';

class AppBarActionWidget extends StatelessWidget {
  const AppBarActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        PopupMenuButton(
          itemBuilder: (context) {
            return List.empty();
          },
        ),
      ],
    );
  }
}
