import 'package:flutter/cupertino.dart';

enum Status { waiting, error }

class VerifyNumber extends StatefulWidget {
  final number;
  const VerifyNumber({super.key, required this.number});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState(number);
}

class _VerifyNumberState extends State<VerifyNumber> {
  final phoneNumber;
  var _status = Status.waiting;
  var _verificationId;

  _VerifyNumberState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Verify Number"),
        previousPageTitle: "Edit Number",
      ),
      child: Container(),
    );
  }
}
