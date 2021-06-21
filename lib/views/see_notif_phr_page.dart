import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/controllers/notif_data_phr_controller.dart';
 
class SeeNotificationPHRPage extends StatelessWidget {
  final notifDataController = Get.put(NotifDataController());
  @override
  Widget build(BuildContext context) {
    notifDataController.fetchNotifData();
    return Scaffold(
      appBar: AppBar(title: Text("See My Phr Notification Data")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:GetX<NotifDataController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.notification.length,
                  itemBuilder: (context, index) {
                    var cardColor = Colors.white;
                    (controller.notification[index].type == "patient") ? cardColor = Colors.green : cardColor = Colors.blueAccent;
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
                                              '${controller.notification[index].hospitalName}',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                              '${controller.notification[index].hospitalSystem}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.notification[index].notificationId}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.notification[index].receiverId}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.notification[index].status}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.notification[index].timestamp}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${controller.notification[index].type}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            ElevatedButton(
                                              child: Text("Confirm"),
                                              onPressed: () async {
                                                  var result = await notifDataController.updateNotifStatus("confirm", controller.notification[index].notificationId);
                                                  print(result);
                                              } 
                                            ),
                                            ElevatedButton(
                                              child: Text("Reject"),
                                              onPressed: () async {
                                                  var result = await notifDataController.updateNotifStatus("reject", controller.notification[index].notificationId);
                                                  print(result);
                                              } 
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