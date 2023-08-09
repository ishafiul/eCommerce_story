import 'package:flutter/material.dart';
import 'package:starter_kit_flutter/core/config/const.dart';
import 'package:starter_kit_flutter/core/config/custom_icons_icons.dart';
import 'package:starter_kit_flutter/core/utils/extention.dart';
import 'package:starter_kit_flutter/core/widgets/horizontal_list.dart';
import 'package:starter_kit_flutter/features/home/domain/models/models.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/item_card.dart';

class HotItemsWidget extends StatelessWidget {
  const HotItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: "ABC Kecap Manis (700ml)",
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2021/04/Haldirams-Jeera-Crispy-Puffs-200G.jpg',
        originalPrice: '650',
        unit: '0.7kg',
      ),
      Item(
        name: "Raj-Kamal Swertia Chirata (50g)",
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2023/01/Swertia-chirata-50g.jpg',
        originalPrice: '2,650',
        unit: '50kg',
      ),
      Item(
        name: "Shan Punjabi Yakhni Pilau (50g)",
        image: 'https://shinjukuhalalfood.com/wp-content/uploads/2023/04/Panjabi-yakhni-pilau-50g.jpg',
        originalPrice: '190',
        offerPercentage: 15,
        offerPrice: "98",
        unit: '50kg',
      ),
      Item(
          name: "Sunflower Oil Premium (1Ltr)",
          image: 'https://shinjukuhalalfood.com/wp-content/uploads/2023/02/Marre-Sunflower-Oil-Premium-1Ltr.png',
          originalPrice: '570',
          offerPercentage: 10,
          offerPrice: "435",
          unit: '1kg',),
      Item(
          name: "Aashirvaad Atta (1kg)",
          image: 'https://shinjukuhalalfood.com/wp-content/uploads/2022/11/Masala-Spices-1.png',
          originalPrice: '570',
          offerPercentage: 5,
          offerPrice: "435",
          unit: '1kg'),
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hot Item",
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
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCardWidget(
              item: items[index],
            );
          },
        )
      ],
    );
  }
}
