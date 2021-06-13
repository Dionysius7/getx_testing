import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/views/register_page.dart';
import 'package:getx_testing/views/shopping_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is Menu Area")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(RegisterPage());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      textStyle: TextStyle(fontSize: 25),
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text("Register Here")),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(ShoppingPage());
                      // Get.snackbar("READ", "Lets see some data!");
                      // Get.defaultDialog(title:"Read Data", content: Text("Lets see some data!"));
                      // Get.bottomSheet(
                      //   Container(
                      //   child: Padding(
                      //       padding: EdgeInsets.all(15),
                      //       child: Center(
                      //           child:
                      //               Text("Read these Data from Bottom Sheet"))),
                      //   color: Colors.white,
                      // ));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      textStyle: TextStyle(fontSize: 25),
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(15),
                    ),
                    child: Text("See Data Here")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
