import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/screens/page3.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key: key);

  var isOn = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Switch(
                  value: isOn.value,
                  onChanged: (value) {
                    isOn.value = value;
                  })),
              ElevatedButton(
                child: Text("Back"),
                onPressed: () {
                  Get.back();
                },
              ),
              ElevatedButton(
                child: Text("Next"),
                onPressed: () {
                  Get.to(Page3());
                },
              )
            ]),
      ),
    );
  }
}
