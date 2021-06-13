import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/controllers/cart_controller.dart';
import 'package:getx_testing/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
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
                                              '${controller.products[index].productName}',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                              '${controller.products[index].productDescription}',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                            Text(
                                              '\$${controller.products[index].price}',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                      ],
                                    ),
                                    RaisedButton(
                                    onPressed: () {
                                        cartController.addToCart(controller.products[index]);
                                    },
                                    color: Colors.blue,
                                    textColor:Colors.white,
                                    child: Text('Add to Cart'),
                                    ),
                                    Obx(() => IconButton(
                                        onPressed: () {
                                          //Toggle only works with bool to change current bool status
                                          controller.products[index].isFavorite.toggle();
                                        }, 
                                        icon: controller.products[index].isFavorite.value 
                                        ? Icon(Icons.check_box_rounded) 
                                        : Icon(Icons.check_box_outline_blank_outlined),

                                      ),
                                    )
                                  ],
                                )),
                          ));
                    });
              }),
            ),
            /*==============================
              GetBuilder Approach [Not Recommended]
            ================================*/
            // GetBuilder<CartController>(
            //   builder: (controller) {
            //       return Text(
            //         'Total amount: \$ ${controller.testAmount}',
            //         style: TextStyle(fontSize: 22, color: Colors.white),
            //       );
            //   },
            // ),
            /*==============================
              GetX Approach
            ================================*/
            // GetX<CartController>(
            //   builder: (controller) {
            //     return Text('Total Amount: \$ ${controller.totalPrice}',
            //     style: TextStyle(fontSize: 32, color: Colors.white),
            //     );
            //   }
            // ),
            /*==============================
              Obx Approach [Easiest & Simplest Way, use controller instance]
            ================================*/
            Obx((){
              return Text('Total Amount: \$ ${cartController.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        }, 
        backgroundColor: Colors.amber,
        icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.black),
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              controller.count.toString(), 
              style: TextStyle(color: Colors.black, fontSize: 20)
            );
          }
        )),
    );
  }
}
