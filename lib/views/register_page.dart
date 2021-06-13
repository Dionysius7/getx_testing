import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_testing/models/user.dart';
import 'package:http/http.dart' as http;

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
  final _formKey = GlobalKey<FormState>();

  // Create Controller to get Data from FORM
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                    const genderSystem =
                        "http://hl7.org/fhir/administrative-gender";
                    const nikSystem =
                        "https://us-central1-phr-api.cloudfunctions.net/nik";
                    const bpjsSystem =
                        "https://us-central1-phr-api.cloudfunctions.net/bpjs";
                    String id = "43E9FZTfsWfXadoDqujj";
                    // ignore: non_constant_identifier_names
                    // final phr_endpoint_get ="https://us-central1-phr-api.cloudfunctions.net/patient/$id";
                    // ignore: non_constant_identifier_names
                    final phr_endpoint_post ="https://us-central1-phr-api.cloudfunctions.net/patient";
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
                          bpjs: Bpjs(system: bpjsSystem, valueString: "123"),
                          nik: Nik(system: nikSystem, valueString: "123")),
                      gender: Gender(
                          code: genderCode,
                          display: genderDisplay,
                          system: genderSystem),
                      name: Address(text: nameController.text),
                      resourceType: "Patient",
                      telecom: Telecom(value: phoneController.text),
                    );

                    // print(userModelToJson([uModel])
                    //     .substring(1, userModelToJson([uModel]).length - 1));

                    
                    // var response = await http.post(url, body: '${userModelToJson([uModel]).substring(1,userModelToJson([uModel]).length-1)}');
                    // var response = await http.get(url);
                    var url = Uri.parse(phr_endpoint_post);
                    var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: jsonEncode(uModel.toJson()));
                    print(response.toString());
                    if (response.statusCode == 201) {
                      var result = jsonDecode(response.body);
                      print("Success $result");

                      // var json = jsonDecode(response.body
                      //         .substring(1, response.body.length - 1));
                      // var nik = json['extension']['nik']['system'];
                      // print("nik system -> $nik");
                      // String message = response.body;
                    } else {
                      print("error ${response.statusCode}");
                    }
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ));
  }
}
