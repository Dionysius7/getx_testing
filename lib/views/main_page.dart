import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/views/create_condition.dart';
import 'package:getx_testing/views/hospital_see_condition_page.dart';
import 'package:getx_testing/views/login_page.dart';
import 'package:getx_testing/views/notification_menu_page.dart';
import 'package:getx_testing/views/qr_menu_page.dart';
import 'package:getx_testing/views/register_page.dart';
import 'package:getx_testing/views/see_condition_page.dart';
import 'package:getx_testing/views/see_notif_phr_page.dart';
import 'package:getx_testing/views/see_patient_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class MainPage extends StatelessWidget {

  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final sessionData = GetStorage();
  final constant = new Const();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hi, ${sessionData.read("patientName")}"), titleTextStyle: TextStyle(fontSize: 6),),
      body: SingleChildScrollView(
        child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(RegisterPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.lightBlue,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("Register PHR Patient Data")),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(SeeNotificationPHRPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.lightBlue,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("See My PHR Notification")),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(SeeConditionPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.lightBlue,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("See My PHR Condition")),
                  ),
                 
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(SeePatientPage());
                          // Get.snackbar("READ", "Lets see some data!");
                          // Get.defaultDialog(title:"Read Data", content: Text("Lets see some data!"));
                          // Get.bottomSheet(
                          //   Container(
                          //   child: Padding(
                          //       padding: EdgeInsets.all(15),
                          //       child: Center(
                          //           child:
                          //               Text("Read these Data from Bottom Sheet"))),
                          //   color: Colors.white,
                          // ));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.lightBlue,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("See My PHR Patient Data")),
                  ),
                   Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(NotificationMenuPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.redAccent,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("Hospital Notification Menu")),
                  ),
                   Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(CreateConditionPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.redAccent,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("Hospital Create Condition")),
                  ),
                   Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(HospitalSeeConditionPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.redAccent,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("Hospital Read Condition")),
                  ),
                   Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(QRMenuPage());
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.redAccent,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("QR Menu")),
                  ),
                   Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          _logoutUser();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          textStyle: TextStyle(fontSize: 25),
                          primary: Colors.redAccent,
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text("Log Out")),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
  _logoutUser() async {
      sessionData.remove("isLogged");
      sessionData.remove("patientName");
      sessionData.remove("patientId");
      Get.offAll(LoginPage());
  }
}
