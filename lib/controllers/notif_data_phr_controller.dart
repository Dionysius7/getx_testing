import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/user.dart';
import 'package:getx_testing/service.dart';

class NotifDataController extends GetxController {
  // var patient = <UserModel>[].obs;
  var service = new Service();
  var constant = new Const();
  var phrId = "BbRlILUcjl5LxYBRf2um";

  void fetchNotifData() async {
    var response = await service.getAllNotifData(constant.phrNotifGet,phrId);
     if(response.statusCode == 200) {
      
    }
    else{
      print(response.statusCode);
    }
  }

  Future<String> postPatientNotif(phrIds) async {
    var response = await service.postNotifToPHR(constant.phrNotifPostPatient, phrIds);
    var result = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      return result['data']['message'];
    } 
    else {
      return result['message'];
    }
  }

  Future<String> postConditionNotif(phrIds) async {
    var response = await service.postNotifToPHR(constant.phrNotifPostCondition, phrIds);
    var result = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      return result['data']['message'];
    } 
    else {
      return result['message'];
    }
  }
}