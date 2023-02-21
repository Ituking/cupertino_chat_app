import 'package:cupertino_chat_app/components/logo.dart';
import 'package:cupertino_chat_app/screens/login/select_country.dart';
import 'package:cupertino_chat_app/screens/login/verify_number.dart';
import 'package:flutter/cupertino.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  final _enterPhoneNumber = TextEditingController();
  Map<String, dynamic> data = {"name": "Japan", "code": "+81"};
  Map<String, dynamic> dataResult = {};
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
          Row(
            children: [
              Expanded(
                child: CupertinoListTile(
                  onTap: () async {
                    dataResult = await Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SelectCountry(),
                      ),
                    );
                    setState(() {
                      data = dataResult;
                    });
                  },
                  title: Text(
                    data["name"],
                    style: const TextStyle(
                      color: Color(0xFF08C187),
                    ),
                  ),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Color(0xFF08C187),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Text(
                    data["code"],
                    style: const TextStyle(
                      fontSize: 25,
                      color: CupertinoColors.secondaryLabel,
                    ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: CupertinoButton.filled(
              child: const Text("Request code"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => VerifyNumber(
                      number: data["code"]! + _enterPhoneNumber.text,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
