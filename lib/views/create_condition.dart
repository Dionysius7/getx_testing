import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/controllers/condition_data_controller.dart';
import 'package:getx_testing/models/condition.dart';
import 'package:getx_testing/service.dart';

class CreateConditionPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hospital Create Conditiion")),
        body: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final conditionDataController = Get.put(ConditionDataController());
  final _formKey = GlobalKey<FormState>();

  // Create Controller to get Data from FORM
  TextEditingController asserterController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController evidenceController = TextEditingController();
  Const env = new Const();
  Service service = new Service();
  String? categoryCode;
  String? codingCode;

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
                hintText: "Enter Asserter Name",
                labelText: "Asserter Name",
              ),
              controller: asserterController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Asserter name is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.category),
                hintText: "Enter Category",
                labelText: "Category",
              ),
              controller: categoryController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Category is required';
                }
                if (value != "Encounter Diagnosis" && value != "Problem List Item") {
                  return 'Category is Unknown';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.check_box),
                hintText: "Enter Code",
                labelText: "Code",
              ),
              controller: codeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Code is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.subject),
                hintText: "Enter Subject PHR Id",
                labelText: "Subject",
              ),
              controller: subjectController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Subject is required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.check),
                hintText: "Enter evidence",
                labelText: "Evidence",
              ),
              controller: evidenceController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Evidence is required';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final categoryDisplay = categoryController.text;
                    //CATEGORY CHECKING
                      if (categoryDisplay == "Encounter Diagnosis") {
                        categoryCode = "encounter-diagnosis";
                      } else if (categoryDisplay == "Problem List Item") {
                        categoryCode = "problem-list-item";
                      } else {
                        categoryCode = "unknown";
                      }
                    //SOON DIAGNOSIS CODE CHECKING
                    ConditionModel cModel = ConditionModel(
                      resourceType: "Condition",
                      category: Category(
                        coding: Coding(
                          code: categoryCode,
                          system: env.categorySystem,
                          display: categoryDisplay
                        ) 
                      ),
                      code: Code(
                        coding: Coding(
                          code: "E11.9",
                          system: env.codeCodingSystem,
                          display: "Non - insulin-dependent diabetes mellitus tanpa komplikasi",
                        ) 
                      ),
                      subject: Subject(
                        reference: env.subjectReferenceSystem,
                        identifier: subjectController.text
                      ),
                      onSetDateTime: DateTime(0),
                      evidence: Evidence(
                        details: evidenceController.text
                      ),
                      asserter: asserterController.text,
                      extension: Extension(
                        url: env.extensionLocationSystem,
                        valueString: env.hospitalNameExample
                      )
                    );
                   var resultMessage = await conditionDataController.postConditionData(cModel, subjectController.text);
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
