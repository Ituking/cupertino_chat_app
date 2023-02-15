import 'dart:ui';

import 'package:cupertino_chat_app/components/lets_start.dart';
import 'package:cupertino_chat_app/components/logo.dart';
import 'package:cupertino_chat_app/components/teams_and_conditions.dart';
import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage("images/salmen-bejaoui-uXTozY3CcQg-unsplash.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Logo(),
                const Text("Hello"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("WhatsApp is a Cross-platform"),
                    Text("mobile messaging with friends"),
                    Text("all over the world"),
                  ],
                ),
                const TeamsAndConditions(),
                const LetsStart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
