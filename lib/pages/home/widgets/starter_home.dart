import 'package:flutter/material.dart';

import '../../../core/data/categories_data.dart';
import '../../../core/data/ifood_more_data.dart';

import 'business_horizontal_list.dart';
import 'business_list.dart';
import 'filter_buttons.dart';
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // maxCrossAxisExtent: 120,
            crossAxisCount: 4,
            mainAxisExtent: 100,
            mainAxisSpacing: 15,
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
        const BusinessHorizontalList(
          title: 'Últimas lojas',
          showFamousList: false,
        ),
        const BannerWidget(),
        HorizontalList(
          title: 'Mais iFood para você',
          list: IFOOD_MORE_DATA,
        ),
        const BusinessHorizontalList(
          title: 'Famosos no iFood',
        ),
        HorizontalList(
          list: SUBCATEGORIES_DATA,
          isContainerNormal: false,
        ),
        const FilterButtons(),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Lojas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
        ),
        const BusinessList(),
      ],
    );
  }
}
