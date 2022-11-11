import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_cart/controller/My_cart_controller.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCartController myCartController = Get.find<MyCartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: GetBuilder<MyCartController>(
        builder: (MyCartController controller) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          "${controller.MycartList[index].image}")),
                  title: Text("${controller.MycartList[index].title}}"),
                  subtitle: Text("\$${controller.MycartList[index].price}"),
                  trailing: IconButton(
                      onPressed: () {
                        controller.removeproduct(controller.MycartList[index]);
                      },
                      icon: Icon(
                        Icons.delete,
                      )),
                );
              },
              itemCount: controller.MycartList.length);
        },
      ),
    );
  }
}
