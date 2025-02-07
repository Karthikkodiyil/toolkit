import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/size_config.dart';

class HomeCarouselWidget extends StatelessWidget {
  const HomeCarouselWidget({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CarouselSlider(
      items: [
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel1.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel2.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel3.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel4.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel5.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel6.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel7.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel8.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel9.path,
          width: width,
        ),
        _CarouselmageWidget(
          img: Assets.image.toolkitCarousel10.path,
          width: width,
        ),
      ],
      options: CarouselOptions(
        height: height,
        //    aspectRatio: 20 / 18,
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
  final double width;
  const _CarouselmageWidget({required this.img, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
    );
  }
}
