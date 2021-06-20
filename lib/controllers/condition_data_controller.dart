import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/condition.dart';
import 'package:getx_testing/service.dart';

class ConditionDataController extends GetxController {
  var condition = <ConditionModel>[].obs;
  var service = new Service();
  var constant = new Const();

  Future<String> postConditionData(data, phrIds) async {
    var cModel = data;
    var response = await service.postConditionData(constant.hospitalConditionPost, jsonEncode(cModel.toJson()), phrIds);

    var result = jsonDecode(response.body);
    
    if (response.statusCode == 201) {
      return result['message'];
    } 
    else {
        return result['error'].toString();
    }
  }

  void fetchConditionData() async {
    var response = await service.getAllConditionData(constant.phrConditionGet, constant.phrId);
     if(response.statusCode == 200) {
      var conditionData = conditionModelFromJson(response.body);
      condition.value = conditionData;
    }
    else{
      print(response.statusCode);
    }
  }

  Future getHospitalConditionData(phrIds) async {
    var response = await service.getAllConditionData(constant.hospitalConditionGet, phrIds);
     if(response.statusCode == 200) {
      var conditionData = conditionModelFromJson(response.body);
      condition.value = conditionData;
    }
    else{
      print(response.statusCode);
    }
  }
}