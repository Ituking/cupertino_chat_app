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
  final _status = Status.error;
  var _verificationId;

  _VerifyNumberState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Verify Number"),
        previousPageTitle: "Edit Number",
      ),
      child: _status != Status.error
          ? Column(
              children: const [],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "OTP verification",
                    style: TextStyle(
                      color: const Color(0xFF08C187).withOpacity(0.7),
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
