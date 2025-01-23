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
                        height: 50,
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
                      _ItemWidget(
                        itemName: "Categories",
                        icon: Icons.apps,
                        trailing: homePageViewModel.isCategory
                            ? const Icon(Icons.keyboard_arrow_up)
                            : const Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          homePageViewModel.toggleCategory();
                        },
                      ),
                      AnimatedContainer(
                        height: homePageViewModel.isCategory ? 130 : 0,
                        width: double.infinity,
                        color: kWhite,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 150),
                        child: homePageViewModel.isCategory
                            ? Column(
                                children: [
                                  CategoryWidget(
                                    checkBox: () {
                                      homePageViewModel.selectCategory("All");
                                    },
                                    value: homePageViewModel.isAllTool,
                                    name: 'All',
                                  ),
                                  CategoryWidget(
                                    checkBox: () {
                                      homePageViewModel.selectCategory("Agri");
                                    },
                                    value: homePageViewModel.isAgriTool,
                                    name: 'Agriculture',
                                  ),
                                  CategoryWidget(
                                    checkBox: () {
                                      homePageViewModel
                                          .selectCategory("Garden");
                                    },
                                    value: homePageViewModel.isGardenTool,
                                    name: 'Gardening',
                                  ),
                                  CategoryWidget(
                                    checkBox: () {
                                      homePageViewModel
                                          .selectCategory("Kitchen");
                                    },
                                    value: homePageViewModel.isKitchenTool,
                                    name: 'Kitchen',
                                  )
                                ],
                              )
                            : Container(),
                      ),
                      const Divider(),
                      _ItemWidget(
                        itemName: "Sign in",
                        icon: Icons.login,
                        onPressed: () {},
                      ),
                      const Divider(),
                      _ItemWidget(
                        itemName: "Privacy policy",
                        icon: Icons.privacy_tip,
                        onPressed: () {},
                      ),
                      const Divider(),
                      _ItemWidget(
                        itemName: "Contact",
                        icon: Icons.phone,
                        trailing: homePageViewModel.isContact
                            ? const Icon(Icons.keyboard_arrow_up)
                            : const Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          homePageViewModel.toggleContact();
                        },
                      ),
                      AnimatedContainer(
                        height: homePageViewModel.isContact ? 100 : 0,
                        width: double.infinity,
                        color: kWhite,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 150),
                        child: homePageViewModel.isContact
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(Assets.icon.whatsappIcon.path)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(Assets.icon.gmailIcon.path)
                                    ],
                                  )
                                ],
                              )
                            : Container(),
                      ),
                      const Divider(),
                    ],
                  )
                : Container()),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final Function() checkBox;
  final bool value;
  final String name;
  const CategoryWidget(
      {super.key,
      required this.checkBox,
      required this.value,
      required this.name});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return SizedBox(
      child: Row(
        children: [
          15.kW,
          Material(
            child: Transform.scale(
              scale: .8,
              child: Checkbox(
                  activeColor: kPrimary,
                  value: value,
                  onChanged: (bool) {
                    checkBox();
                  }),
            ),
          ),
          5.kW,
          Text(
            name,
            style: styles.blackRegular12,
          )
        ],
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String itemName;
  final IconData icon;
  final Widget? trailing;
  final Function()? onPressed;
  const _ItemWidget(
      {required this.itemName,
      required this.icon,
      this.trailing,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppStyles styles = AppStyles();
    return SizedBox(
      child: Column(
        children: [
          MaterialButton(
            minWidth: double.infinity,
            height: 45,
            onPressed: onPressed,
            child: Row(
              children: [
                Icon(icon),
                10.kW,
                Text(
                  itemName,
                  style: styles.blackBold14,
                ),
                const Spacer(),
                trailing ?? Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
