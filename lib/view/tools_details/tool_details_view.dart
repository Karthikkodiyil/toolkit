import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/components/appbar_component.dart';
import 'package:toolkit/view/home/widgets/home_side_bar.dart';
import 'package:toolkit/view/tools_details/widgets/tool_detail_carousel_widget.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class ToolDetailsView extends StatelessWidget {
  const ToolDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final homepageController = Provider.of<HomePageViewmodel>(context);
    return Stack(
      children: [
        Scaffold(
            backgroundColor: kWhite,
            body: SafeArea(
                child: Column(
              children: [
                const AppBarComponent(),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ToolDetailCarouselWidget(
                          images: homepageController.selectedTool!.img!),
                    )
                  ],
                )
              ],
            ))),
        Consumer<HomePageViewmodel>(
            builder: (context, homepageViewModel, child) =>
                const AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    left: 0,
                    child: HomeSideBar()))
      ],
    );
  }
}
