import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:sample_project/core/config/const.dart';

class PromoBannerWidget extends StatelessWidget {
  const PromoBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 305,
            autoPlay: true,
            viewportFraction: .6,
            enlargeCenterPage: true,
          ),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () {

              },
              child: Img(
                'assets/images/promo.png',
                width: 305,
                height: 305,
                borderRadius:
                const BorderRadius.all(Radius.circular(10)),
              ),
            );
          },
        ),
      ],
    );
  }
}
