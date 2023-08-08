import 'package:flutter/material.dart';
import 'package:starter_kit_flutter/core/config/custom_icons_icons.dart';
import 'package:starter_kit_flutter/core/widgets/layout/layout.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/categores.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/hot_tems.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/new_arrivals.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/offer_items.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/promo_banner.dart';
import 'package:starter_kit_flutter/features/home/presentation/widgets/stories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        appBar: LayoutAppBar(
            leading: AppbarLeading(
                child: const Icon(
              CustomIcons.hamburger,
            )),
            appBarTitle: TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.black.withOpacity(0.05),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFAAA6A7), width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(color: Colors.transparent),

                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  hintText: "Search Here",
                  suffixIcon: const Icon(
                    CustomIcons.voice,
                    color: Colors.green,
                  ),
                  prefixIcon: const Icon(
                    CustomIcons.seach_01,
                  )),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CustomIcons.trophy,
                    size: 32,
                  ))
            ]),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              StoriesWidget(),
              SizedBox(
                height: 14,
              ),
              CategoryWidget(),
              OfferItemsWidget(),
              SizedBox(
                height: 14,
              ),
              HotItemsWidget(),
              PromoBannerWidget(),
              SizedBox(
                height: 14,
              ),
              NewArrivalsWidget()
            ],
          ),
        ));
  }
}
