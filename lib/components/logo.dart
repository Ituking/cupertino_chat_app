import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  const Logo(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        shape: BoxShape.rectangle,
        color: Colors.white.withOpacity(0.8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Image(
          image: AssetImage("images/whatsapp.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
