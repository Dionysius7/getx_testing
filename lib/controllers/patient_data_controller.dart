import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/const.dart';
import 'package:getx_testing/models/user.dart';
import 'package:getx_testing/service.dart';
import 'package:get_storage/get_storage.dart';

class PatientDataController extends GetxController {
  var service = new Service();
  var constant = new Const();
  GetStorage sessionData = GetStorage();
  List<UserModel> patient = <UserModel>[].obs;
  RxBool isLoading = false.obs;

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
    isLoading.value = true;
    try {
      var response = await service.getPatientData(constant.phrPatientGet,sessionData.read("patientId"));
     if(response.statusCode == 200) {
      var patientData = userModelFromJson(response.body);
      print(response.body);
      print(patientData);
      patient = patientData;
    isLoading.value = false;

    }
    else{
      print(response.statusCode);
    isLoading.value = false;

    }
      
    } catch (e) {
    isLoading.value = false;
      print("error nih fetch data -> $e");

    }
    
  }
  
  Future<List<UserModel>> fetchPatientByPhone(phone) async {
    final response = await service.getPatientDataByPhone(constant.phrLoginPatient,phone);
     if(response.statusCode == 200) {
      List<UserModel> patientData = userModelFromJson(response.body);
      return patient = patientData;
    }
    else{
      print(response.body);

      return [];
    }
  }
}