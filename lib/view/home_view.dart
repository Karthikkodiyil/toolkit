import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toolkit/model/tools_model.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/size_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: kWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Toolkit",
                  style: styles.primBold20,
                ),
                Text(
                  " Go to greeen",
                  style: styles.blackRegular11,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(
                  height: 40,
                  child: SearchAnchor.bar(
                      suggestionsBuilder: (context, searchController) {
                    return [];
                  }),
                ),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage(Assets.image.manProfile.path),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              15.kH,
              Container(
                decoration: const BoxDecoration(),
                child: CarouselSlider(
                  items: [
                    _CarouselmageWidget(img: Assets.image.toolkitCarousel.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel1.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel2.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel3.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel4.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel5.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel6.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel7.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel8.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel9.path),
                    _CarouselmageWidget(
                        img: Assets.image.toolkitCarousel10.path),
                  ],
                  options: CarouselOptions(
                    height: SizeConfig.screenWidth * 0.2,
                    //   aspectRatio: 20 / 18,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.8,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: toolList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration:
                          BoxDecoration(border: Border.all(color: kBlack)),
                      // child: Column(),
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }
}

class _CarouselmageWidget extends StatelessWidget {
  final String img;
  const _CarouselmageWidget({required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
    );
  }
}
