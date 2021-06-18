import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/condition.dart';
import 'package:getx_testing/service.dart';

class GetConditionDataController extends GetxController {
  var condition = <ConditionModel>[].obs;
  var service = new Service();
  var constant = new Const();


  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      fetchConditionData();
    }

  void fetchConditionData() async {
    var response = await service.getAllConditionData(constant.phrConditionGet, constant.phrId);
    print(response.body);
    print(response.statusCode);
     if(response.statusCode == 200) {
      var conditionData = conditionModelFromJson(response.body);
      print(conditionData);
      condition.value = conditionData;
    }
    else{
      print(response.statusCode);
    }
  }
}