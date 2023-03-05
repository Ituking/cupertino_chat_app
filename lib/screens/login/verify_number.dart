import 'package:cupertino_chat_app/screens/login/user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum Status { waiting, error }

class VerifyNumber extends StatefulWidget {
  final String number;
  const VerifyNumber({super.key, required this.number});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState(number);
}

class _VerifyNumberState extends State<VerifyNumber> {
  final String phoneNumber;
  Status? _status;
  late String _verificationId = "";
  final _textEditingController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _VerifyNumberState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  Future _verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) async {},
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            this._verificationId = verificationId;
            if (kDebugMode) {
              print('id: $_verificationId');
            }
          });
        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) async {});
  }

  Future _sendCodeToFirebase({String? code}) async {
    if (_verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: code!);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => UserName()));
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            setState(() {
              _textEditingController.text = "";
              _status = Status.error;
            });
          });
    }
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
                const Text(
                  "Enter OTP sent to",
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel,
                    fontSize: 20,
                  ),
                ),
                Text(phoneNumber),
                CupertinoTextField(
                  onChanged: (value) async {
                    if (kDebugMode) {
                      print(value);
                    }
                    if (value.length == 6) {
                      _sendCodeToFirebase(code: value);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(letterSpacing: 30, fontSize: 30),
                  maxLength: 6,
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  autofillHints: const <String>[AutofillHints.telephoneNumber],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive the OTP?"),
                    CupertinoButton(
                        child: const Text("RESEND OTP"),
                        onPressed: () async {
                          setState(() {
                            _status = Status.waiting;
                          });
                          _verifyPhoneNumber();
                        }),
                  ],
                ),
              ],
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
                const Text("The code used is invalid!"),
                CupertinoButton(
                  child: const Text("Edit Number"),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoButton(
                  child: const Text("Resend Code"),
                  onPressed: () async {
                    setState(
                      () {
                        _status = Status.waiting;
                      },
                    );
                    _verifyPhoneNumber();
                  },
                ),
              ],
            ),
    );
  }
}
