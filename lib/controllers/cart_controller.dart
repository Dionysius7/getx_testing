import 'package:get/get.dart';
import 'package:getx_testing/models/product.dart';
class CartController extends GetxController{
  // GetX Approach
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum,item) => sum + item.price!.toDouble());
  
  //Get builder approach
  var testAmount = 0.0;

  addToCart(Product product){
    /*==============================
      GetX Approach
    ================================*/
    cartItems.add(product);

    /*==============================
      GetBuilder Approach
    ================================*/
    // testAmount = totalPrice;
    // update();
  }

}