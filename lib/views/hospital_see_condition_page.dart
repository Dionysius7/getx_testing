import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/controllers/condition_data_controller.dart';
import 'package:getx_testing/models/condition.dart';
import 'package:getx_testing/service.dart';

class HospitalSeeConditionPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hospital See Condition Page")),
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
  TextEditingController phrIdController = TextEditingController();
  Const env = new Const();
  Service service = new Service();
  String? genderCode;
  var conditionData;

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
                    //Refresh Page
                    // setState(() {});
                    conditionData = await conditionDataController.getHospitalConditionData(phrIdController.text);
                  }
                },
                child: const Text("Submit"),
              ),
            ),
            Expanded(
              child:GetX<ConditionDataController>(builder: (conditionData) {
                if(conditionData.condition.length == 0){
                  return Card(child: Text("No Data"));
                }
                else{
                return ListView.builder(
                  itemCount: conditionData.condition.length,
                  itemBuilder: (context, index) {
                    var cardColor = Colors.white;
                    return Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: cardColor,
                          margin: const EdgeInsets.all(12),
                          child: SizedBox(
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${conditionData.condition[index].asserter}',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].category!.coding!.display}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].category!.coding!.code}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].category!.coding!.system}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].code!.coding!.display}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].code!.coding!.code}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].code!.coding!.system}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].evidence!.details}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].extension!.valueString}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].onSetDateTime}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].subject!.identifier}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${conditionData.condition[index].resourceType}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ));
                      }
                  );
                }
              }),
            ),
          ],
        ));
  }
}
