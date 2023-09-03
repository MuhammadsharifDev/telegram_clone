import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegram_clone/presentation/main/chat_page/chat_page.dart';
import 'package:telegram_clone/presentation/main/settings/setting_page.dart';

import 'contacts/contacts_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.user == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return true;
          },
          child: Scaffold(
            body: IndexedStack(
              index: state.bottomMenu.index,
              children: const [
                ChatPage(),
                ContactsPage(),
                SettingPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.bottomMenu.index,
              onTap: (index) {
                context
                    .read<MainBloc>()
                    .add(SetBottomMenuEvent(menu: BottomMenu.values[index]));
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_sharp), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.contacts), label: 'Contacts'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'setting'),
              ],
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepPurple,
            ),
          ),
        );
      },
    );
  }
}
