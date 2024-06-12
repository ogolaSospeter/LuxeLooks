import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

// List<ProductModel> productModelFromJson(String str) =>
//     List<ProductModel>.from(json
//         .decode(str)['productList']
//         .map((x) => ProductModel.fromJson(Map<String, dynamic>.from(x))));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  String brand;
  String name;
  String price;
  String imageLink;
  String description;
  double? rating;
  String productType;
  DateTime createdAt;
  DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.imageLink,
    required this.description,
    this.rating,
    required this.productType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        brand: json['brand'],
        name: json['name'],
        price: json['price'],
        imageLink: json['image_link'],
        description: json['description'],
        rating: json['rating']?.toDouble(),
        productType: json['product_type'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "imageLink": imageLink,
        "description": description,
        "rating": rating,
        "productType": productType,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
