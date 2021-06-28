import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/notification.dart';
import 'package:getx_testing/service.dart';
import 'package:get_storage/get_storage.dart';


class NotifDataController extends GetxController {
  var notification = <NotifModel>[].obs;
  var service = new Service();
  var constant = new Const();
  GetStorage sessionData = GetStorage();

  void fetchNotifData() async {
    var response = await service.getAllNotifData(constant.phrNotifGet, sessionData.read("patientId"));
     if(response.statusCode == 200) {
      var notifData = notifModelFromJson(response.body);
      print(notifData);
      notification.value = notifData;
    }
    else{
      print(response.statusCode);
    }
  }

  Future<String> postPatientNotif(phrIds) async {
    var response = await service.postNotifToPHR(constant.hospitalNotifPostPatient, phrIds);
    var result = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      return result['data']['message'];
    } 
    else {
      return result['message'];
    }
  }

  Future<String> postConditionNotif(phrIds) async {
    var response = await service.postNotifToPHR(constant.hospitalNotifPostCondition, phrIds);
    var result = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      return result['data']['message'];
    } 
    else {
      return result['message'];
    }
  }

  Future updateNotifStatus(status,id) async {
    var response = await service.updatePHRNotifStatus(constant.phrNotifUpdate,status,id);
    print(response.body);
    print(response.statusCode);
    var result = jsonDecode(response.body);
    print(result);

    if (response.statusCode == 200) {
      return result['data'];
    } 
    else {
      return result['message'];
    }
  }
}