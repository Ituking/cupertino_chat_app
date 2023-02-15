import 'package:cupertino_chat_app/screens/calls.dart';
import 'package:cupertino_chat_app/screens/chats.dart';
import 'package:cupertino_chat_app/screens/people.dart';
import 'package:cupertino_chat_app/screens/settings.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List screens = [
    const Chats(),
    const Calls(),
    const People(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              label: "Calls",
              icon: Icon(CupertinoIcons.phone),
            ),
            BottomNavigationBarItem(
              label: "People",
              icon: Icon(CupertinoIcons.person_alt_circle),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(CupertinoIcons.settings_solid),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return screens[index];
        },
      ),
    );
  }
}
