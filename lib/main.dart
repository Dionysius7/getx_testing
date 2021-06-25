import 'package:flutter/material.dart';
import 'package:getx_testing/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/views/main_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final sessionData = GetStorage();
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    sessionData.writeIfNull('isLogged', false);
    if(sessionData.read('isLogged') == true){
      return GetMaterialApp(
        home: MainPage(),
      );
    } else{
      return GetMaterialApp(
        home: LoginPage(),
      );
    }
  }
}

