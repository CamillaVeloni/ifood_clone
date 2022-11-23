import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/home/widgets/category_item.dart';

import '../../core/data/categories_data.dart';
import '../../core/styles/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget get getAppBar => SliverAppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const <Widget>[
            Text(
              'R. da República, 102',
              style: TextStyle(color: kTextTitlesColor, fontSize: 16),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
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
            Tab(text: "Início"),
            Tab(text: "Restaurante"),
            Tab(text: "Mercados"),
            Tab(text: "Bebidas"),
            Tab(text: "Farmácias"),
            Tab(text: "Pets"),
            Tab(text: "Shopping"),
          ],
        ),
      );

  Widget starterHomePage(BuildContext context) => CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final item = CATEGORIES_DATA[index];
                return CategoryItem(
                  name: item.name,
                  photoAsset: item.photoAsset,
                );
              },
              childCount: CATEGORIES_DATA.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: PageView.builder(
                  itemCount: 5,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    final banner = 'banner_0${pagePosition + 1}.png';
                    return Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                        width: 240,
                        height: 200,
                        child: Image.asset('assets/images/$banner'),
                    ));
                  }),
            ),
          ),
          // SliverFixedExtentList(
          //   itemExtent: 50.0,
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.lightBlue[100 * (index % 9)],
          //         child: Text('List Item $index'),
          //       );
          //     },
          //   ),
          // ),
        ],
      );

  Widget get getStarterWidget => Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: CATEGORIES_DATA.length,
              itemBuilder: (BuildContext context, int index) {
                final item = CATEGORIES_DATA[index];
                return CategoryItem(
                  name: item.name,
                  photoAsset: item.photoAsset,
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120,
              ),
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                final banner = 'banner_0${index + 1}.png';
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 240,
                    height: 200,
                    child: Image.asset('assets/images/$banner'),
                  ),
                );
              }),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [getAppBar];
          },
          body: TabBarView(
            children: <Widget>[
              starterHomePage(context),
              const Center(child: Text("Restaurante")),
              const Center(child: Text("Mercados")),
              const Center(child: Text("Bebidas")),
              const Center(child: Text("Farmácias")),
              const Center(child: Text("Pets")),
              const Center(child: Text("Shopping")),
            ],
          ),
        ),
      ),
    );
  }
}
