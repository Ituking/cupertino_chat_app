import 'package:cupertino_chat_app/components/logo.dart';
import 'package:flutter/cupertino.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  final _enterPhoneNumber = TextEditingController();
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
                  "Verification・one step",
                  style: TextStyle(
                    color: const Color(0xFF08C187).withOpacity(0.7),
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Enter your phone number",
            style: TextStyle(
              color: CupertinoColors.systemGrey.withOpacity(0.7),
              fontSize: 28,
            ),
          ),
          CupertinoListTile(
            onTap: () {},
            title: const Text(
              "Japan",
              style: TextStyle(
                color: Color(0xFF08C187),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "+81",
                  style: TextStyle(
                    fontSize: 25,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
                Expanded(
                  child: CupertinoTextField(
                    placeholder: "Enter your phone number",
                    controller: _enterPhoneNumber,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 25,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "You will receive an activation code in short time",
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 15,
            ),
          ),
          CupertinoButton.filled(
            child: const Text("Request code"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
