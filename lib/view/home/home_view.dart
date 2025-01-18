import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/responsive_widget.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view/home/widgets/home_carousel_widget.dart';
import 'package:toolkit/view/home/widgets/home_search_widget.dart';
import 'package:toolkit/view/home/widgets/home_side_bar.dart';
import 'package:toolkit/view/home/widgets/tool_box_widget.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    SizeConfig().init(context);
    return Stack(children: [
      Scaffold(
        backgroundColor: kWhite,
        // appBar: AppBar(
        //   //centerTitle: true,
        //   leading: Consumer<HomePageViewmodel>(
        //       builder: (context, homepageViewModel, child) => IconButton(
        //           onPressed: () {
        //             homepageViewModel.toggleSideBar();
        //           },
        //           icon: const Icon(Icons.menu))),
        //   backgroundColor: kWhite,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       SizedBox(
        //           height: 35,
        //           child: Image.asset(Assets.image.toolkitLogo.path)),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             "Toolkit",
        //             style: styles.primBold20,
        //           ),
        //           Text(
        //             " Go to greeen",
        //             style: styles.blackRegular11,
        //           ),
        //         ],
        //       ),
        //       const Expanded(
        //         child: Padding(
        //           padding: EdgeInsets.only(left: 15, right: 15),
        //           child: SizedBox(
        //             height: 40,
        //             child: HomeSearchWidget(),
        //           ),
        //         ),
        //       ),
        //       CircleAvatar(
        //         radius: 20,
        //         backgroundImage: AssetImage(Assets.image.manProfile.path),
        //       )
        //     ],
        //   ),
        // ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              color: kPrimary,
              height: 110,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<HomePageViewmodel>(
                            builder: (context, homepageViewModel, child) =>
                                IconButton(
                                    onPressed: () {
                                      homepageViewModel.toggleSideBar();
                                    },
                                    icon: const Icon(Icons.menu))),
                        SizedBox(
                            height: 35,
                            child: Image.asset(Assets.image.toolkitLogo.path)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Toolkit",
                              style: styles.whiteRegular18,
                            ),
                            Text(
                              " Go to greeen",
                              style: styles.blackRegular11,
                            ),
                          ],
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage(Assets.image.manProfile.path),
                        )
                      ],
                    ),
                    HomeSearchWidget(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight - 110,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
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
