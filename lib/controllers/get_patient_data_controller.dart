import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/user.dart';
import 'package:getx_testing/service.dart';

class GetPatientDataController extends GetxController {
  var patient = <UserModel>[].obs;
  var service = new Service();
  var constant = new Const();

  @override
  void onInit() {
    super.onInit();
    fetchPatientData();
  }

  void fetchPatientData() async {
    var response = await service.getPatientData(constant.phrPatientGet,constant.phrId);
     if(response.statusCode == 200) {
      var patientData = userModelFromJson(response.body);
      print(patientData);
      patient.value = patientData;
    }
    else{
      print(response.statusCode);
    }
  }
}