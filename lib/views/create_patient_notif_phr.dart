import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/controllers/notif_data_phr_controller.dart';
import 'package:getx_testing/service.dart';

class CreatePatientNotificationPHR extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Create Patient Notification PHR Page")),
        body: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final notifDataController = Get.put(NotifDataController());
  final _formKey = GlobalKey<FormState>();

  // Create Controller to get Data from FORM
  TextEditingController phrIdController = TextEditingController();
  Const env = new Const();
  Service service = new Service();
  String? genderCode;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Enter PHR Id",
                labelText: "Phr Id",
              ),
              controller: phrIdController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phr Id is required';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                  var resultMessage = await notifDataController.postPatientNotif(phrIdController.text);
                   Get.defaultDialog(title:"Response", content: Text(resultMessage.toString()));
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ));
  }
}
