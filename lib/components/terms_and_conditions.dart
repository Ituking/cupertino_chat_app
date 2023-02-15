import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Text(
        "Terms and conditions",
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
