import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:sample_project/core/config/const.dart';
import 'package:sample_project/core/config/custom_icons_icons.dart';
import 'package:sample_project/core/utils/extention.dart';
import 'package:sample_project/core/widgets/horizontal_list.dart';

import '../../domain/models/models.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorList = [
      const Color(0xFF53B175),
      const Color(0xFFF8A44C),
      const Color(0xFF53B1A3),
      const Color(0xFF5953B1),
      const Color(0xFF8F53B1),
      const Color(0xFFF7A593),
      const Color(0xFFB1AF53),
    ];
    final images = [
      'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Coooking-1.png',
      'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Meat-Fish-1.png',
      'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Masala-Spices-1.png',
      'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Beans-Lentil-1.png',
      'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Snacks-Sweets-1.png',
      'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Drinks-Beverage-1.png',
      'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Nuts-Dry-Fruits-1.png'
    ];

    final List<CategoryType> category = [
      CategoryType(
        color: const Color(0xFF53B175),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Coooking-1.png',
        name: 'Cooking',
      ),
      CategoryType(
        color: const Color(0xFFF8A44C),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Meat-Fish-1.png',
        name: 'Cooking',
      ),
      CategoryType(
        color: const Color(0xFFF7A593),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Masala-Spices-1.png',
        name: 'Cooking',
      ),
      CategoryType(
        color: const Color(0xFF5953B1),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Beans-Lentil-1.png',
        name: 'Cooking',
      ),
      CategoryType(
        color: const Color(0xFF8F53B1),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Beans-Lentil-1.png',
        name: 'Cooking',
      ),
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("See All"),
                  Icon(
                    CustomIcons.arrow,
                    size: 12,
                  )
                ].withSpaceBetween(width: 8),
              )
            ],
          ),
        ),
        HorizontalList(
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 129,
                  height: 109,
                  decoration: BoxDecoration(
                    color: category[index].color.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Img(
                        category[index].image,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  category[index].name,
                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
