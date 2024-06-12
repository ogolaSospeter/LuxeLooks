// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class DetailsPage extends StatelessWidget {
  final int index;

  DetailsPage({super.key, required this.index});

  final AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${controller.productList[index].brand}\'s brand',
            style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 280,
                //width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            controller.productList[index].imageLink))),
              ),
              const SizedBox(height: 22),
              Text(
                controller.productList[index].name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Text(
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16, height: 1.3),
                  controller.productList[index].description),
              // const SizedBox(height: 20),
              // const Text('Rating: ',
              //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              // Text(
              //   controller.productList[index].rating.toString(),
              //   style: const TextStyle(fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 25),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "\$" "${controller.productList[index].price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
              ]),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
