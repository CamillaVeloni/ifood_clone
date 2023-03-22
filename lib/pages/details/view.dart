import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class BusinessDetailsPage extends GetView<BusinessDetailsController> {
  const BusinessDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios,color: Colors.red),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share,color: Colors.red),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.heart,color: Colors.red),
          ),
        ],
        toolbarHeight: 100,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // business info title

          // tab bar
        ),
      ),
    );
  }
}
