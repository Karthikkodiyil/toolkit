import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/appbar_component.dart';
import 'package:toolkit/utils/components/responsive_widget.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view/home/widgets/home_carousel_widget.dart';
import 'package:toolkit/view/home/widgets/home_side_bar.dart';
import 'package:toolkit/view/home/widgets/tool_box_widget.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
  SizeConfig().init(context);
    return Stack(children: [
      Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
            child: Column(
          children: [
            const AppBarComponent(),
            SizedBox(
              height: SizeConfig.screenHeight - 120,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Column(
                    children: [
                      15.kH,
                      Container(
                          decoration: const BoxDecoration(),
                          child: ResponsiveWidget(
                              mediumDevice: HomeCarouselWidget(
                                width: SizeConfig.screenWidth * 0.9,
                                height: SizeConfig.screenWidth * 0.31,
                              ),
                              mobile: HomeCarouselWidget(
                                width: SizeConfig.screenWidth * 0.85,
                                height: SizeConfig.screenWidth * 0.35,
                              ),
                              web: HomeCarouselWidget(
                                width: SizeConfig.screenWidth * 0.8,
                                height: SizeConfig.screenWidth * 0.2,
                              ))),
                      15.kH,
                      const ResponsiveWidget(
                          mobile: ToolBoxWidget(
                            crossAxisCount: 2,
                          ),
                          mediumDevice: ToolBoxWidget(
                            crossAxisCount: 4,
                          ),
                          web: ToolBoxWidget(
                            crossAxisCount: 5,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
      Consumer<HomePageViewmodel>(
          builder: (context, homepageViewModel, child) =>
              const AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  left: 0,
                  child: HomeSideBar()))
    ]);
  }
}

