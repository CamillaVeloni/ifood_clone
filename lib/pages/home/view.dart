import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/starter_home.dart';
import '../../core/styles/styles.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Widget get _getAppBar => SliverAppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Text(
              controller.address,
              style: const TextStyle(color: kTextTitlesColor, fontSize: 16),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
              size: 20,
            ),
          ],
        ),
        bottom: const TabBar(
          labelColor: Colors.red,
          isScrollable: true,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: kTextTitlesColor,
          tabs: [
            Tab(text: 'Início'),
            Tab(text: 'Restaurantes'),
            Tab(text: 'Mercados'),
            Tab(text: 'Bebidas'),
            Tab(text: 'Farmácias'),
            Tab(text: 'Pets'),
            Tab(text: 'Shopping'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [_getAppBar];
          },
          body: const TabBarView(
            children: <Widget>[
              StarterHome(),
              Center(child: Text("Restaurante")),
              Center(child: Text("Mercados")),
              Center(child: Text("Bebidas")),
              Center(child: Text("Farmácias")),
              Center(child: Text("Pets")),
              Center(child: Text("Shopping")),
            ],
          ),
        ),
      ),
    );
  }
}
