import 'package:cupertino_chat_app/components/logo.dart';
import 'package:flutter/cupertino.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Edit Number"),
        previousPageTitle: "Back",
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Logo(width: 80.0, height: 80.0, radius: 30.0),
              Expanded(
                child: Text(
                  "Verification ・ one step",
                  style: TextStyle(
                    color: const Color(0xFF08C187).withOpacity(0.7),
                    fontSize: 30,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
