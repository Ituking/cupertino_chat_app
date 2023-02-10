import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: CupertinoThemeData(brightness: Brightness.light),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt_circle),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return Center(
            child: Text("$index"),
          );
        },
      ),
    );
  }
}
