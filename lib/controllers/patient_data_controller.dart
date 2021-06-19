import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/user.dart';
import 'package:getx_testing/service.dart';

class PatientDataController extends GetxController {
  var service = new Service();
  var constant = new Const();
  var patient = <UserModel>[].obs;

  Future<String> postPatientData(data) async {
    var url = Uri.parse(constant.phrPatientPost);
    var uModel = data;
    var response = await service.postPatientData(url,jsonEncode(uModel.toJson()));
    var result = jsonDecode(response.body);
    
    if (response.statusCode == 201) {
      return result['message'];
    } else {
      return result['error']['0']['msg'];
    }
    
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