import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/service.dart';

class RegisterPatientController extends GetxController {
  var service = new Service();
  var constant = new Const();

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
}