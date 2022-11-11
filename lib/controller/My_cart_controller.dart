import 'package:get/get.dart';
import 'package:shopping_cart/services/product_services.dart';

import '../model/product_model.dart';

class MyCartController extends GetxController {
  final List<ProductModel> _MycartList = [];

  List<ProductModel> get MycartList => _MycartList;
  late List<ProductModel> ProductList;
  bool apiLoader = true;

  @override
  void onInit() {
    //api ,method return json data

    getProductApi().then((value) {
      ProductList = productModelFromJson(value);
      apiLoader = false;
      update();
    });

    super.onInit();
  }

  void addproduct(ProductModel value) {
    _MycartList.add(value);
    update();
    print(_MycartList);
  }

  void removeproduct(ProductModel value) {
    _MycartList.remove(value);
    update();
  }

  bool isExist(ProductModel value) {
    return _MycartList.contains(value);
  }
}
