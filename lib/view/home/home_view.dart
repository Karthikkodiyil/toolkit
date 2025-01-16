import 'package:flutter/material.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/responsive_widget.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view/home/widgets/home_carousel_widget.dart';
import 'package:toolkit/view/home/widgets/home_search_widget.dart';
import 'package:toolkit/view/home/widgets/tool_box_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Stack(children: [
      Scaffold(
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
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    height: 40,
                    child: HomeSearchWidget(),
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
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                15.kH,
                Container(
                  decoration: const BoxDecoration(),
                  child: const HomeCarouselWidget(),
                ),
                15.kH,
                const ResponsiveWidget(
                    mobile: ToolBoxWidget(
                      crossAxisCount: 2,
                    ),
                    web: ToolBoxWidget(
                      crossAxisCount: 4,
                    ))
              ],
            ),
          ),
        )),
      ),
      Container(
        height: SizeConfig.screenHeight,
        width: 250,
        color: kRed,
      )
    ]);
  }
}
