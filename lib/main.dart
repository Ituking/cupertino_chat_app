import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_chat_app/screens/calls.dart';
import 'package:cupertino_chat_app/screens/chats.dart';
import 'package:cupertino_chat_app/screens/people.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

const bool useEmulator = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (useEmulator) {
    _connectToFirebaseEmulator();
  }
  runApp(const MyApp());
}

Future _connectToFirebaseEmulator() async {
  const fireStorePort = "8080";
  const authPort = "9099";
  final localhost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
      host: "$localhost:$fireStorePort",
      sslEnabled: false,
      persistenceEnabled: false);

  await FirebaseAuth.instance.useAuthEmulator(
    "http://$localhost:8080",
    "http//$authPort:9099" as int,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF08C187),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List screens = [
    const Chats(),
    const Calls(),
    const People(),
    const Settings(),
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
