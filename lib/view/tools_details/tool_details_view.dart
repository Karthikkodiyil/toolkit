import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/model/tools_model.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
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
                const Spacer(),
                Center(
                  child: ResponsiveWidget(
                    mobile: DetailWidget(
                      selectedTool: selectedTool,
                      width: SizeConfig.screenWidth * 0.95,
                      height: SizeConfig.screenHeight * 0.95 - 50,
                    ),
                    web: DetailWidget(
                      selectedTool: selectedTool,
                      width: SizeConfig.screenWidth * 0.75,
                      height: SizeConfig.screenHeight * 0.75,
                    ),
                    mediumDevice: DetailWidget(
                      selectedTool: selectedTool,
                      width: SizeConfig.screenWidth * 0.85,
                      height: SizeConfig.screenHeight * 0.85,
                    ),
                  ),
                ),
                const Spacer(),
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
  final double width;
  final double height;

  const DetailWidget({
    super.key,
    required this.selectedTool,
    required this.width,
    required this.height,
  });

  final ToolsModel selectedTool;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppStyles styles = AppStyles();
    return SizedBox(
      height: height,
      width: width,
      //  color: kGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                constraints:
                    BoxConstraints(maxHeight: SizeConfig.screenHeight * 0.7),
                width: width * 0.45,
                height: width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToolDetailCarouselWidget(images: selectedTool.img!),
                ),
              ),
            ],
          ),
          SizedBox(
            //  color: kRed,
            width: width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedTool.name ?? "",
                  style: styles.blackBold16,
                ),
                10.kH,
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "₹${selectedTool.prize ?? "00"}",
                        style: styles.blackBold14,
                      ),
                      25.kW,
                      Text(
                        "₹${selectedTool.oldPrize ?? "00"}",
                        style: styles.strikeText,
                      ),
                    ],
                  ),
                ),
                10.kH,
                Text(
                  "Description",
                  style: styles.blackRegular12,
                ),
                5.kH,
                Text(
                  style: styles.blackRegular11,
                  selectedTool.disc ?? "",
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
