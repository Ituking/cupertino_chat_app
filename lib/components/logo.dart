import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        shape: BoxShape.rectangle,
        color: Colors.white.withOpacity(0.8),
      ),
      child: const Image(
        image: AssetImage("images/whatsapp.png"),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
