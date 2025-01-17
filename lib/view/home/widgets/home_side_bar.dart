import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppStyles styles = AppStyles();
    return Consumer<HomePageViewmodel>(
      builder: (context, homePageViewModel, child) => SafeArea(
        child: AnimatedContainer(
            height: SizeConfig.screenHeight,
            width: homePageViewModel.isSideBar ? 250 : 0,
            color: kWhite,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 200),
            child: homePageViewModel.isSideBar
                ? Column(
                    children: [
                      Container(
                        height: 45,
                        width: 250,
                        color: kPrimary,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Row(
                            children: [
                              Image.asset(Assets.image.toolkitLogo.path),
                              15.kW,
                              Text(
                                "Toolkit",
                                style: styles.whiteRegular18,
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    homePageViewModel.toggleSideBar();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: kWhite,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      7.kH,
                      const _ItemWidget(
                        itemName: "Categories",
                        icon: Icons.apps,
                      ),
                      const _ItemWidget(
                        itemName: "Sign in",
                        icon: Icons.login,
                      ),
                      // const _ItemWidget(
                      //   itemName: "Terms and Conditions",
                      //   icon: Icons.list,
                      // ),
                      const _ItemWidget(
                        itemName: "Privacy policy",
                        icon: Icons.privacy_tip,
                      ),
                      const _ItemWidget(
                        itemName: "Contact",
                        icon: Icons.phone,
                      )
                    ],
                  )
                : Container()),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String itemName;
  final IconData icon;
  const _ItemWidget({super.key, required this.itemName, required this.icon});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return Column(
      children: [
        MaterialButton(
          minWidth: double.infinity,
          height: 45,
          onPressed: () {},
          child: Row(
            children: [
              Icon(icon),
              10.kW,
              Text(
                itemName,
                style: styles.blackBold14,
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
