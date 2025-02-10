import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/model/tools_model.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class ToolBoxWidget extends StatelessWidget {
  final int crossAxisCount;

  const ToolBoxWidget({
    super.key,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppStyles styles = AppStyles();
    return Material(
      color: kWhite,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: toolList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<HomePageViewmodel>(
                  builder: (context, homepageController, child) {
                return InkWell(
                  onTap: () {
                    homepageController.detailsNavigation(
                        context, toolList[index]);
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: kPrimary)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          toolList[index].img!.first),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Text(
                            toolList[index].name ?? "",
                            style: styles.primMedium16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${toolList[index].prize ?? "00"}",
                                style: styles.blackBold14,
                              ),
                              Text(
                                "₹${toolList[index].oldPrize ?? "00"}",
                                style: styles.strikeText,
                              ),
                            ],
                          ),
                          Text(
                            toolList[index].disc ?? "",
                            style: styles.blackRegular10,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}
