import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '/pages/home/controller.dart';
import '../../../core/api/api_util.dart';

import '../../../core/data/categories_data.dart';
import '../../../core/data/ifood_more_data.dart';

import 'action_buttons.dart';
import 'banner_widget.dart';
import 'carousel_widget.dart';
import '../../../core/widgets/horizontal_list.dart';
import 'category_item.dart';

class StarterHome extends StatelessWidget {
  const StarterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                photoAsset: item.photoUrl,
              );
            },
            childCount: CATEGORIES_DATA.length,
          ),
        ),
        const CarouselWidget(),
        HorizontalList(
          title: 'Últimas lojas',
          list: IFOOD_MORE_DATA,
          itemType: TypeOfContainer.circle,
        ),
        const BannerWidget(),
        HorizontalList(
          title: 'Mais iFood para você',
          list: IFOOD_MORE_DATA,
        ),
        HorizontalList(
          title: 'Famosos no iFood',
          list: IFOOD_MORE_DATA,
          itemType: TypeOfContainer.circle,
        ),
        HorizontalList(
          list: SUBCATEGORIES_DATA,
          itemType: TypeOfContainer.colored,
        ),
        ActionButtons(),
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: ElevatedButton(
        //       onPressed: () async {
        //         final client = await ApiUtil.getRestClient();
        //
        //         client.getRestaurants().then((it) => print(it.length));
        //       },
        //       child: const Text('click me pls'),
        //     ),
        //   ),
        // ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           color:
        //           index % 2 == 0 ? Colors.green : Colors.greenAccent,
        //           height: 80,
        //           alignment: Alignment.center,
        //           child: Text(
        //             "Item $index",
        //             style: const TextStyle(fontSize: 30),
        //           ),
        //         ),
        //       );
        //     },
        //     childCount: 40,
        //   ),
        // ),
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
  }
}
