import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/views/otp_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:60),
                  child: Center(
                    child: Text("OTP Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:20, right:10, left: 10),
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.phone)
                      )),
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                )),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: FlatButton(
                color: Colors.blue,
                child: Text("Next", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Get.off(OtpPage(_controller.text));
                },
              ),
            )
          ],
        ));
  }
}
