import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/notification.dart';
import 'package:getx_testing/service.dart';

class GetNotifDataController extends GetxController {
  var notification = <NotifModel>[].obs;
  var service = new Service();
  var constant = new Const();
  var phrId = "BbRlILUcjl5LxYBRf2um";

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      fetchNotifData();
    }

  void fetchNotifData() async {
    var response = await service.getAllNotifData(constant.phrNotifGet, phrId);
     if(response.statusCode == 200) {
      var notifData = notifModelFromJson(response.body);
      print(notifData);
      notification.value = notifData;
    }
    else{
      print(response.statusCode);
    }
  }
}