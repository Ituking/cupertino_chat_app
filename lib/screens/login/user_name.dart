import 'package:flutter/cupertino.dart';

class UserName extends StatelessWidget {
  var _text = TextEditingController();
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Enter your name"),
          CupertinoTextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
            maxLength: 15,
            controller: _text,
            keyboardType: TextInputType.name,
            autofillHints: <String>[AutofillHints.name],
          ),
        ],
      ),
    );
  }
}
