import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controller/My_cart_controller.dart';
import 'package:shopping_cart/controller/internet_check_controller.dart';
import 'package:shopping_cart/screens/my_cart.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCartController myCartController = Get.put(MyCartController());
    InternetCheckController internetCheckController =
        Get.put(InternetCheckController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(MyCart());
                },
                icon: Icon(Icons.add_shopping_cart))
          ],
        ),
        body: GetBuilder<InternetCheckController>(
          builder: (InternetCheckController controller) {
            if (controller.internetCheckLoder) {
              //if internet is exist or not check progress
              return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red));
            } else {
              if (controller.internet) {
                //if internet is exist
                return GetBuilder<MyCartController>(
                  builder: (MyCartController controller) {
                    if (controller.apiLoader) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                      "${controller.ProductList[index].image}")),
                              title: Text(
                                  "${controller.ProductList[index].title}"),
                              subtitle: Text(
                                  "\$${controller.ProductList[index].price}"),
                              trailing: IconButton(
                                onPressed: () {
                                  if (!controller
                                      .isExist(controller.ProductList[index])) {
                                    controller.addproduct(
                                        controller.ProductList[index]);
                                  } else {
                                    controller.removeproduct(
                                        controller.ProductList[index]);
                                  }
                                },
                                icon: (controller
                                        .isExist(controller.ProductList[index]))
                                    ? Icon(
                                        Icons.add_shopping_cart,
                                      )
                                    : Icon(Icons.shopping_cart),
                              ),
                            );
                          },
                          itemCount: controller.ProductList.length);
                    }
                  },
                );
              } else {
                //if internet is not exist
                return Material(
                  child: Center(child: Text("No Internet")),
                );
              }
            }
          },
        ));
  }
}
