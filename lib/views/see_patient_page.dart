import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/controllers/patient_data_controller.dart';
 
class SeePatientPage extends StatelessWidget {
  final patientDataController = Get.put(PatientDataController());

  @override
  Widget build(BuildContext context) {
    patientDataController.fetchPatientData();
    return Scaffold(
      appBar: AppBar(title: Text("See My Patient Data")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // child:GetX<PatientDataController>(builder: (controller) {
              //   return 
              // }),
             child: Obx( ()=> patientDataController.isLoading.value? Center(child: CircularProgressIndicator(),) : ListView.builder(
                  itemCount: patientDataController.patient.length,
                  itemBuilder: (context, index) {
                    // print("CHECK NAME ${patientDataController.patient[index].name!.text}");
                    return Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.all(12),
                          child: SizedBox(
                            height:MediaQuery.of(context).size.height/4.5,
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${patientDataController.patient[index].name!.text}',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                              '${patientDataController.patient[index].phrId}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${patientDataController.patient[index].gender!.display}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${patientDataController.patient[index].telecom!.value}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${patientDataController.patient[index].birthdate}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${patientDataController.patient[index].address!.text}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${patientDataController.patient[index].extension!.bpjs!.valueString}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              '${patientDataController.patient[index].extension!.nik!.valueString}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ));
                    }
                  )),
            ),
          ],
        ),
      ),
    );
  }
}