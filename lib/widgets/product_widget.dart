import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(2, 4)),
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.imageLink))),
              ),
              Positioned(
                  right: 8,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.green,
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          product.rating != null
              ? Container(
                  margin: const EdgeInsets.only(left: 10),

                  // height: 30,
                  width: 45,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(product.rating.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(
              "\$" "${product.price}",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
