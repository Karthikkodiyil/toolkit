import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/model/tools_model.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/appbar_component.dart';
import 'package:toolkit/utils/components/responsive_widget.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view/home/widgets/home_side_bar.dart';
import 'package:toolkit/view/tools_details/widgets/tool_detail_carousel_widget.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class ToolDetailsView extends StatelessWidget {
  const ToolDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final homepageController = Provider.of<HomePageViewmodel>(context);
    final selectedTool = homepageController.selectedTool!;
    return Stack(
      children: [
        Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: SizedBox(
                height: 45,
                width: 45,
                child: Image.asset(Assets.icon.whatsappIcon.path),
              ),
            ),
            backgroundColor: kWhite,
            body: SafeArea(
                child: Column(
              children: [
                const AppBarComponent(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                  child: ResponsiveWidget(
                    mobile: DetailWidget(
                      selectedTool: selectedTool,
                      imgWidth: SizeConfig.screenWidth * 0.85,
                      textWidth: 400,
                    ),
                    web: DetailWidget(
                      selectedTool: selectedTool,
                      imgWidth: SizeConfig.screenWidth * 0.4,
                      textWidth: SizeConfig.screenWidth * 0.4,
                    ),
                    mediumDevice: DetailWidget(
                      selectedTool: selectedTool,
                      imgWidth: SizeConfig.screenWidth * 0.45,
                      textWidth: SizeConfig.screenWidth * 0.45,
                    ),
                  ),
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

class DetailWidget extends StatelessWidget {
  final double imgWidth;
  final double textWidth;

  const DetailWidget(
      {super.key,
      required this.selectedTool,
      required this.imgWidth,
      required this.textWidth});

  final ToolsModel selectedTool;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: kGrey)),
          width: imgWidth,
          height: imgWidth,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ToolDetailCarouselWidget(images: selectedTool.img!),
          ),
        ),
        SizedBox(
          width: textWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(selectedTool.name ?? ""),
              SizedBox(
                child: Row(
                  children: [
                    Text(selectedTool.prize ?? ""),
                    Text(selectedTool.oldPrize ?? ""),
                  ],
                ),
              ),
              Text("Description"),
              Text(
                selectedTool.disc ?? "",
                maxLines: null,
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}
