import 'package:flutter/material.dart';
import 'package:starter_kit_flutter/core/config/const.dart';
import 'package:starter_kit_flutter/core/config/custom_icons_icons.dart';
import 'package:starter_kit_flutter/core/utils/extention.dart';
import 'package:starter_kit_flutter/core/widgets/horizontal_list.dart';
import 'package:starter_kit_flutter/features/home/domain/models/models.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/item_card.dart';

class NewArrivalsWidget extends StatelessWidget {
  const NewArrivalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
          name: "ABC Kecap Manis (700ml)",
          image: 'https://shinjukuhalalfood.com/wp-content/uploads/2023/07/ABC-kecap-manis-700ml.jpg',
          originalPrice: '650',
          offerPercentage: 12,
          offerPrice: "510",
          isFavorite: true,
          unit: '0.7kg'),
      Item(
          name: "India Gate Basmati Rice Premium (5kg) インドゲートバスマティライス",
          image: 'https://shinjukuhalalfood.com/wp-content/uploads/2020/11/India-Gate-Basmati-Rice-Premium-5kg-2.png',
          originalPrice: '2,650',
          offerPercentage: 15,
          offerPrice: '2,290',
          unit: '5kg'),
      Item(
          name: "Daawat Everyday Basmati Rice Gold (5Kg) エブリデイ バスマティ ライス ゴールド",
          image: 'https://shinjukuhalalfood.com/wp-content/uploads/2021/04/Daawat-Everyday-Basmati-Rice-Gold-5Kg-1.png',
          originalPrice: '2,150 ',
          offerPercentage: 11,
          offerPrice: "1,698",
          unit: '5kg'),
      Item(
          name: "Sunflower Oil Premium (1Ltr)",
          image: 'https://shinjukuhalalfood.com/wp-content/uploads/2023/02/Marre-Sunflower-Oil-Premium-1Ltr.png',
          originalPrice: '570',
          offerPercentage: 10,
          offerPrice: "435",
          unit: '1kg'),
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
                "New Arrivals",
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
