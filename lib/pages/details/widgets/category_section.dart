import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifood_clone/core/models/menu.dart';
import '../../../core/widgets/menu_image.dart';
import '/core/models/category_menu.dart';

class CategorySection extends StatelessWidget {
  final CategoryMenuRestModel categoryMenu;
  final bool isFirst;

  const CategorySection({
    Key? key,
    required this.categoryMenu,
    required this.isFirst,
  }) : super(key: key);

  TextTheme _textTheme(context) => Theme.of(context).textTheme;

  Widget get _getTileHeader => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isFirst) const Divider(),
          const SizedBox(height: 12),
          Text(
            categoryMenu.name,
            style: _textTheme(Get.context!).titleLarge,
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 5),
        ],
      );

  Widget get _getMenuTile => Column(
        children: List.generate(
          categoryMenu.menu.length,
          (index) {
            final menu = categoryMenu.menu[index];
            bool isLastIndex = index == categoryMenu.menu.length - 1;
            return _buildFoodTile(
              menu: menu,
              isLastIndex: isLastIndex,
            );
          },
        ),
      );

  Widget _buildFoodTile({
    required bool isLastIndex,
    required MenuRestModel menu,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFoodDetail(menu: menu),
            MenuImage(imageUrl: menu.imageUrl),
          ],
        ),
        !isLastIndex ? const Divider(height: 16.0) : const SizedBox(height: 8.0)
      ],
    );
  }

  Widget _buildFoodDetail({
    required MenuRestModel menu,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(menu.name, style: _textTheme(Get.context!).titleSmall),
          const SizedBox(height: 4),
          Text(
            menu.description,
            style: _textTheme(Get.context!).bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "R\$" + ' ${menu.price}',
                style: _textTheme(Get.context!).titleSmall,
              ),
              // Text(
              //   menu.comparePrice,
              // ),
              const SizedBox(width: 8.0),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTileHeader,
          _getMenuTile,
        ],
      ),
    );
  }
}
