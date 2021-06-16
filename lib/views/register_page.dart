import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/controllers/register_patient_controller.dart';
import 'package:getx_testing/models/user.dart';
import 'package:getx_testing/service.dart';

class RegisterPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Register Page")),
        body: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final registerPatientController = Get.put(RegisterPatientController());
  final _formKey = GlobalKey<FormState>();

  // Create Controller to get Data from FORM
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
                hintText: "Enter Your Name",
                labelText: "Name",
              ),
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "Enter Your Phone Number",
                labelText: "Phone",
              ),
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Enter Your Gender (Male/Female)",
                labelText: "Gender",
              ),
              controller: genderController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Gender is required';
                }
                if (value != "Male" && value != "Female") {
                  return 'Gender is Unknown';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.book),
                hintText: "Enter Address",
                labelText: "Address",
              ),
              controller: addressController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Address is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: "Enter Your DoB",
                labelText: "Date of Birth",
              ),
              controller: dateController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Day Of Birth is required';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final genderDisplay = genderController.text;
                    if (genderDisplay == "Male") {
                      genderCode = "male";
                    } else if (genderDisplay == "Female") {
                      genderCode = "female";
                    } else {
                      genderCode = "unknown";
                    }
                    UserModel uModel = UserModel(
                      address: Address(text: addressController.text),
                      birthdate: DateTime(2000, 10, 20),
                      extension: Extension(
                          bpjs: Bpjs(system: env.bpjsSystem, valueString: "123"),
                          nik: Nik(system: env.nikSystem, valueString: "123")),
                      gender: Gender(
                          code: genderCode,
                          display: genderDisplay,
                          system: env.genderSystem),
                      name: Address(text: nameController.text),
                      resourceType: "Patient",
                      telecom: Telecom(value: phoneController.text),
                    );
                   var resultMessage = await registerPatientController.postPatientData(uModel);
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
