import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/views/create_condition.dart';
import 'package:getx_testing/views/hospital_see_condition_page.dart';
import 'package:getx_testing/views/notification_menu_page.dart';
import 'package:getx_testing/views/register_page.dart';
import 'package:getx_testing/views/see_condition_page.dart';
import 'package:getx_testing/views/see_notif_phr_page.dart';
import 'package:getx_testing/views/see_patient_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {

  final String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hi, $uid")),
      body: Row(
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
            ],
          ),
        ],
      ),
    );
  }
}
