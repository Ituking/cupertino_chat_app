import 'dart:ui';

import 'package:flutter/material.dart';

class BlurImagePageScaffold extends StatelessWidget {
  final body;
  final String imagePath;
  const BlurImagePageScaffold({super.key, this.body, required this.imagePath});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: body,
          ),
        ),
      ),
    );
  }
}
