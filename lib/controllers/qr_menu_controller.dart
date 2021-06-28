import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class QRMenuController extends GetxController {
  RxString imgUrl = "".obs;
  RxBool isLoading = false.obs;
  RxString resultDataId = "".obs;

  loadImage() async {
    isLoading.value = true;
    await FirebaseStorage.instance
        .ref()
        .child("avatar/mukadimas.jpg")
        .getDownloadURL()
        .then((value) =>
            {imgUrl.value = value.toString(), isLoading.value = false});
  }

  scanImage() async {
    isLoading.value = true;
    var options = ScanOptions(
      autoEnableFlash: false,
      android: AndroidOptions(
        aspectTolerance: 0,
        useAutoFocus: true,
      ),
    );
    ScanResult result = await BarcodeScanner.scan(options: options);
    resultDataId = result.rawContent.toString().obs;
    isLoading.value = false;
  }
}
