import 'package:get/get.dart';
import 'package:getx_testing/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
        id:1,
        price:30,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'firstProduct'
      ),
      Product(
        id:2,
        price:40,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'seconddProduct'
      ),
      Product(
        id:3,
        price:49.5,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'thirdProduct'
      ),
    ];
    products.value = productResult;
  }
}