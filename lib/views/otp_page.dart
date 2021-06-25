import 'package:flutter/material.dart';
import 'package:getx_testing/views/main_page.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  final String phone;
  OtpPage(this.phone);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final sessionData = GetStorage();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text("OTP Verification"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text("Verifying ${widget.phone}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                withCursor: true,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                      .signInWithCredential(
                        PhoneAuthProvider.credential(
                          verificationId: _verificationCode!,
                          smsCode: pin
                        )
                      )
                      .then((value) async {
                          sessionData.write("patientName","Dionysius Sentausa");
                          sessionData.write("isLogged",true);
                          print(sessionData.read("patientName"));
                          print(sessionData.read("isLogged"));
                          if(value.user != null ){
                              Get.offAll(MainPage());
                          }
                      });
                  }catch (e) {
                    FocusScope.of(context).unfocus();
                    _scaffoldkey.currentState!.showSnackBar(SnackBar(content: Text("invalid OTP")));
                  }
                },
              ),
            )
          ],
        ));
  }

  _verifyPhone() async {
    
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+62${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          sessionData.write("patientName","Dionysius Sentausa");
          sessionData.write("isLogged",true);
          print(sessionData.read("patientName"));
          print(sessionData.read("isLogged"));
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Get.offAll(MainPage());
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
