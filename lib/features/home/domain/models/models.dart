import 'dart:ui';

class CategoryType {
  final String image;
  final Color color;
  final String name;

  CategoryType({required this.color, required this.image, required this.name});
}

class Item {
  final String image;
  final String name;
  final int? offerPercentage;
  final bool isFavorite;
  final String unit;
  final String originalPrice;
  final String? offerPrice;

  Item({
    required this.name,
    required this.image,
    this.isFavorite = false,
    this.offerPercentage,
    this.offerPrice,
    required this.originalPrice,
    required this.unit,
  });
}
