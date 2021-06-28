import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/controllers/qr_menu_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get_storage/get_storage.dart';


class QRMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qrController = Get.put(QRMenuController());
    GetStorage sessionData = GetStorage();
    qrController.loadImage();
    return MaterialApp(
      title: 'QR MENU PAGE',
      home: Scaffold(
          appBar: AppBar(
            title: Text('QR MENU PAGE'),
          ),
          body: Obx(
            () => Center(
              child: qrController.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                    children: [
                      // Image.network(qrController.imgUrl.value),
                      ElevatedButton(
                      onPressed: () {
                        qrController.scanImage();
                      },
                      child: Text("Scan a QR Code")),
                      Text(qrController.resultDataId.value),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: QrImage(
                          data: sessionData.read("patientId"),
                          version: QrVersions.auto,
                          size: MediaQuery.of(context).size.width/2,
                          gapless: false,
                          errorCorrectionLevel: QrErrorCorrectLevel.H,
                          embeddedImage: NetworkImage(qrController.imgUrl.value),
                          embeddedImageStyle: QrEmbeddedImageStyle(size: Size(60,60)),
                        ),
                      )
                    ]),
            ),
          )),
    );
  }
}
