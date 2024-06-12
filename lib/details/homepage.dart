import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxelooks/details/details.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Import the package

import '../../controllers/app_controller.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SizedBox(
          height: 500,
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.productList.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    crossAxisCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailsPage(index: index));
                        },
                        child: ProductWidget(
                            product: controller.productList[index]),
                      );
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  ),
          ),
        ),
      ),
    );
  }
}
