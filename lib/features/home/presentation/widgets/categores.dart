import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:starter_kit_flutter/core/config/const.dart';
import 'package:starter_kit_flutter/core/config/custom_icons_icons.dart';
import 'package:starter_kit_flutter/core/utils/extention.dart';
import 'package:starter_kit_flutter/core/widgets/horizontal_list.dart';
import 'package:starter_kit_flutter/features/home/domain/models/models.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryType> category = [
      CategoryType(
        color: const Color(0xFF53B175),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Coooking-1.png',
        name: 'Cooking',
      ),
      CategoryType(
        color: const Color(0xFFF8A44C),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Meat-Fish-1.png',
        name: 'Meat & Fish',
      ),
      CategoryType(
        color: const Color(0xFFF7A593),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Masala-Spices-1.png',
        name: 'Masala & Spice',
      ),
      CategoryType(
        color: const Color(0xFF5953B1),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Beans-Lentil-1.png',
        name: 'Beans & Lentil',
      ),
      CategoryType(
        color: const Color(0xFF8F53B1),
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Snacks-Sweets-1.png',
        name: 'Snacks & Sweets',
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
                  const Text("See All"),
                  const Icon(
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
                const SizedBox(
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
