import 'dart:ffi';

import 'package:store_app/models/rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final String description;
  // final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.description,
    // required this.rating,
  });

  factory Product.fromJson(json) {
    return Product(
      id: json['id'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      title: json['title'],
      category: json['category'],
      description: json['description'],
      // rating: Rating.fromJson(json['rating']),
    );
  }
}
