import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:sample_project/core/config/colors.dart';
import 'package:sample_project/core/config/custom_icons_icons.dart';
import 'package:sample_project/core/utils/extention.dart';
import 'package:sample_project/features/home/domain/models/models.dart';

class ItemCardWidget extends HookWidget {
  final Item item;

  const ItemCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavorite = useState(false);
    useEffect(() {
      isFavorite.value = item.isFavorite;
      return null;
    }, []);
    return Stack(
      children: [
        Container(
          height: 187,
          width: 130,
          decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            height: 90,
            width: 120,
            decoration: const BoxDecoration(color: Colors.white),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Img(
                item.image,
                width: 90,
                height: 90,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 28,
                height: 28,
                color: ArtistaColor.primary,
                child: const Center(child: Icon(CustomIcons.add, size: 12, color: Colors.white)),
              ),
            )),
        Positioned(
            right: 0,
            top: 0,
            child: IconButton(
                onPressed: () {
                  isFavorite.value = !isFavorite.value;
                },
                icon: isFavorite.value
                    ? const Icon(
                        CustomIcons.love,
                        color: Colors.red,
                      )
                    : const Icon(
                        CustomIcons.love_outline,
                      ))),
        if (item.offerPercentage != null)
          Positioned(
              left: 11,
              top: 11,
              child: Container(
                height: 20,
                width: 27.27,
                color: const Color(0xFF37AD57).withOpacity(0.1),
                child: Center(
                  child: Text(
                    "${item.offerPercentage}%",
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: ArtistaColor.primary, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        Positioned(
            top: 107,
            left: 10,
            right: 10,
            child: Text(
              item.name,
              style: const TextStyle(fontSize: 13),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )),
        Positioned(bottom: 28, left: 10, child: Text(item.unit)),
        Positioned(
            bottom: 3,
            left: 10,
            child: Row(
              children: [
                Text("¥${item.offerPrice ?? item.originalPrice}",
                    style: TextStyle(color: ArtistaColor.primary, fontWeight: FontWeight.bold, fontSize: 14)),
                if (item.offerPrice != null)
                  Text("¥${item.originalPrice}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10, decoration: TextDecoration.lineThrough))
              ].withSpaceBetween(width: 5),
            ))
      ],
    );
  }
}
