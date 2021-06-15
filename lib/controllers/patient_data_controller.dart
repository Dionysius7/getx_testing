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
    var res_body = userModelFromJson(response.body);
    print(res_body);
    print(res_body.runtimeType);
    var x = (userModelFromJson(res_body.toString()));
    print(x);
    print(x.runtimeType);
    print("z");
    print(UserModel.fromJson(jsonDecode(response.body)));
     print("y");
    if(response.statusCode == 200) {
      var patientData = UserModel.fromJson(jsonDecode(response.body));
      print(patientData);
    }
    else{
      print(response.statusCode);
    }


    patient.value = response;
  }
}