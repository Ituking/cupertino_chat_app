import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_chat_app/screens/login/user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

const bool useEmulator = true;

Future<void> main() async {
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
  final localHost = Platform.isAndroid ? "10.0.2.2" : "localhost";
  FirebaseFirestore.instance.settings = Settings(
    host: "$localHost:$fireStorePort",
    sslEnabled: false,
    persistenceEnabled: false,
  );

  await FirebaseAuth.instance.useAuthEmulator(
    "http://$localHost",
    "http://$authPort" as int,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: UserName(),
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF08C187),
      ),
    );
  }
}
