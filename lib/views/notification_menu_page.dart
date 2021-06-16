import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/views/create_condition_notif_phr.dart';
import 'package:getx_testing/views/create_patient_notif_phr.dart';
import 'package:getx_testing/views/see_notif_phr_page.dart';


class NotificationMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is Notification Menu Area")),
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
                      Get.to(CreatePatientNotificationPHR());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      textStyle: TextStyle(fontSize: 25),
                      primary: Colors.redAccent,
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text("Create Patient Notification to PHR")),
              ),
             
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(CreateConditionNotificationPHR());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      textStyle: TextStyle(fontSize: 25),
                      primary: Colors.redAccent,
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text("Create Condition Notification to PHR")),
              ),
               Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(SeeNotificationPHR());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      textStyle: TextStyle(fontSize: 25),
                      primary: Colors.redAccent,
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text("Read Notification to PHR")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
