import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  Page3({Key? key}) : super(key: key);
  var color = Colors.green.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page3"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    color.value =
                        color == Colors.red ? Colors.green : Colors.red;
                  },
                  child: AnimatedContainer(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: color.value),
                    duration: Duration(seconds: 2),
                  ),
                );
              })
            ]),
      ),
    );
  }
}
