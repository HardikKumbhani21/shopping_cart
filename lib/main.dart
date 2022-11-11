import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/screens/page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page3(),
    );
  }
}
