import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/home/controller.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 6,
        height: 6,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: PageView.builder(
                  itemCount: controller.allBanners.length,
                  pageSnapping: false,
                  controller: controller.pageController,
                  onPageChanged: controller.changeActivePage,
                  itemBuilder: (context, pagePosition) {
                    final banner = controller.allBanners[pagePosition];
                    return Container(
                      height: 140,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/$banner',
                            fit: BoxFit.cover),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(
                  controller.allBanners.length, controller.activePage.value),
            ),
          ],
        ),
      );
    });
  }
}
