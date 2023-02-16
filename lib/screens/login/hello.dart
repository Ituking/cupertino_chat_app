import 'package:cupertino_chat_app/components/blur_image_page_scaffold.dart';
import 'package:cupertino_chat_app/components/lets_start.dart';
import 'package:cupertino_chat_app/components/logo.dart';
import 'package:cupertino_chat_app/components/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurImagePageScaffold(
      imagePath: "images/salmen-bejaoui-uXTozY3CcQg-unsplash.jpg",
      body: [
        const Logo(width: 150, height: 150, radius: 50),
        Text(
          "Hello",
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 60,
            fontWeight: FontWeight.normal,
          ),
        ),
        Column(
          children: [
            Text(
              "WhatsApp is a Cross-platform",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "mobile messaging with friends",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "all over the world",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        TermsAndConditions(
          onPressed: () {},
        ),
        LetsStart(
          onPressed: () {},
        ),
      ],
    );
  }
}
