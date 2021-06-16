import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/user.dart';
import 'package:getx_testing/service.dart';

class PatientDataController extends GetxController {
  var patient = <UserModel>[].obs;
  var service = new Service();
  var constant = new Const();
  var phrId = "JvtX529DroHAzhDpHsQV";

  @override
  void onInit() {
    super.onInit();
    fetchPatientData();
  }

  void fetchPatientData() async {
    var response = await service.getPatientData(constant.phrPatientGet,phrId);
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