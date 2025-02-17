import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toolkit/utils/components/size_config.dart';

class ToolDetailCarouselWidget extends StatelessWidget {
  const ToolDetailCarouselWidget({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CarouselSlider(
      items: List.generate(
          images.length,
          (index) => _CarouselmageWidget(
                img: images[index],
              )),
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.8,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _CarouselmageWidget extends StatelessWidget {
  final String img;

  const _CarouselmageWidget({
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
    );
  }
}
