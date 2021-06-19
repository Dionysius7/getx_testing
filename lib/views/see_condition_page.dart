import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/controllers/condition_data_controller.dart';
 
class SeeConditionPage extends StatelessWidget {
  final conditionDataController = Get.put(ConditionDataController());

  @override
  Widget build(BuildContext context) {
    conditionDataController.fetchConditionData();
    return Scaffold(
      appBar: AppBar(title: Text("See My Phr Condition Data")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:GetX<ConditionDataController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.condition.length,
                  itemBuilder: (context, index) {
                    var cardColor = Colors.white;
                    return Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: cardColor,
                          margin: const EdgeInsets.all(12),
                          child: SizedBox(
                            height:MediaQuery.of(context).size.height/4.5,
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
                                              '${controller.condition[index].asserter}',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              '${controller.condition[index].category!.coding!.display}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.condition[index].code!.coding!.display}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.condition[index].evidence!.details}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.condition[index].extension!.valueString}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.condition[index].onSetDateTime}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.condition[index].subject!.identifier}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.condition[index].resourceType}',
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}