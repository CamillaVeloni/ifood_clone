import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '/core/widgets/header_info.dart';
import 'search_action.dart';
import '../../../core/widgets/ficon_button.dart';
import '../../../core/widgets/rate_widget.dart';
import '/core/models/business.dart';
import 'delivery_actions.dart';

class CustomAppBar extends SliverAppBar {
  final BusinessRestModel data;
  final BuildContext context;
  final RxBool isCollapsed;
  @override
  final double expandedHeight;
  @override
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  const CustomAppBar(
      {super.key,
      required this.data,
      required this.context,
      required this.isCollapsed,
      required this.expandedHeight,
      required this.collapsedHeight,
      required this.scrollController,
      required this.tabController,
      required this.onCollapsed,
      required this.onTap})
      : super(elevation: 0, pinned: true, forceElevated: false);

  @override
  Color? get backgroundColor => Colors.white;

  @override
  Widget? get leading {
    return Center(
      child: FIconButton(
        onPressed: Get.back,
        backgroundColor: Colors.white,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  @override
  List<Widget>? get actions {
    return [
      Obx(() => Visibility(
        visible: isCollapsed.value,
        child: FIconButton(
          backgroundColor: Colors.white,
          onPressed: () {},
          icon: const Icon(Icons.ios_share),
        ),
      ),),
      FIconButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        icon: const Icon(CupertinoIcons.heart),
      ),
    ];
  }

  @override
  Widget? get title {
    var textTheme = Theme.of(context).textTheme;
    return Obx(
      () => AnimatedOpacity(
        opacity: isCollapsed.value ? 0 : 1,
        duration: const Duration(milliseconds: 250),
        child: Center(
          child: Text(
            data.name,
            style: textTheme.titleMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Obx(
        () => !isCollapsed.value
            ? Container(
                color: Colors.white70,
                child: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                  indicatorColor: Colors.red,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 3.0,
                  tabs: data.categoriesMenu.map((e) {
                    return Tab(text: e.name);
                  }).toList(),
                  onTap: onTap,
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              HeaderInfo(
                imageUrl: data.photoUrl,
                name: data.name,
                bannerUrl: data.bannerUrl,
                price: data.price,
                category: data.categories.first.title,
                context: context,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const DeliveryActions(),
                    RateWidget(
                      rate: data.rating,
                      rateText: '${data.rating.toDouble()}',
                      reviewCount: '${data.reviewCount}',
                    ),
                    const SizedBox(height: 12),
                    const SearchAction(),
                  ],
                ),
              ),
              Divider(thickness: 1, color: Colors.grey.shade500),
            ],
          ),
        );
      },
    );
  }
}
