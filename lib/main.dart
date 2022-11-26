import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/home/binding.dart';

import '/pages/home/view.dart';
import 'core/styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ifood Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
      ),
      home: const HomePage(),
      initialBinding: HomeBinding(),
    );
  }
}
