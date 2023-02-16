import 'package:flutter/cupertino.dart';

class LetsStart extends StatelessWidget {
  final onPressed;
  const LetsStart({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.right_chevron,
            color: CupertinoColors.white.withOpacity(0.7),
          ),
          Text(
            "Let's Start",
            style: TextStyle(
              color: CupertinoColors.white.withOpacity(0.7),
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
