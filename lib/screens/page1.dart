import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  var counter = 0.obs;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
      ),
      body: Center(child: Obx(() {
        print("obx");
        return Text("Counter: $counter");
      })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.value++;
          },
          child: Icon(Icons.add)),
    );
  }
}

// ElevatedButton(
// child: Text("Next"),
// onPressed: () {
// Get.defaultDialog(title: "title", content: Text("sjahkdfcgk"));
// Get.snackbar("title", "message", snackPosition: SnackPosition.BOTTOM);
// // Get.to(Page2());
// },
// )
