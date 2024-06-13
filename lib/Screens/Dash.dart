import 'package:flutter/material.dart';
import 'package:luxelooks/details/homepage.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        const Text(
          "Featured Products",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 5.0),
        const FeaturedProducts(),
        const SizedBox(height: 10.0),
        const Text(
          "Top Rated",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 2.0),
        Expanded(child: HomePage()),
        // HomePage()
      ],
    );
  }
}

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: const [
          Card(
            color: Colors.greenAccent,
            shadowColor: Color.fromARGB(255, 192, 151, 2),
            surfaceTintColor: Colors.deepOrangeAccent,
            child: _FeaturedCard(cardName: 'Elevated Card'),
          ),
          Card(
            color: Color.fromARGB(255, 8, 206, 91),
            shadowColor: Color.fromARGB(255, 2, 135, 197),
            surfaceTintColor: Colors.deepOrangeAccent,
            child: _FeaturedCard(cardName: 'Filled Card'),
          ),
          Card(
            color: Color.fromARGB(255, 22, 189, 0),
            shadowColor: Colors.amberAccent,
            surfaceTintColor: Colors.deepOrangeAccent,
            child: _FeaturedCard(cardName: 'Outlined Card'),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 150,
      child: Center(child: Text(cardName)),
    );
  }
}



// class TopRated extends StatelessWidget {
//   TopRated({super.key});

//   final AppController controller = Get.put(AppController());

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
//         child: SizedBox(
//           height: 700,
//           child: Obx(
//             () => controller.isLoading.value
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : StaggeredGridView.countBuilder(
//                     shrinkWrap: true,
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: controller.productList.length,
//                     crossAxisSpacing: 20,
//                     mainAxisSpacing: 25,
//                     crossAxisCount: 2,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Get.to(() => DetailsPage(index: index));
//                         },
//                         child: ProductWidget(
//                             product: controller.productList[index]),
//                       );
//                     },
//                     staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
