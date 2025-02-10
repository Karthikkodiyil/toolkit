import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/app_styles.dart';
import 'package:toolkit/utils/assets/assets.gen.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppStyles styles = AppStyles();
    return Container(
      color: kPrimary,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<HomePageViewmodel>(
                    builder: (context, homepageViewModel, child) => IconButton(
                        onPressed: () {
                          homepageViewModel.toggleSideBar();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: kWhite,
                        ))),
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
                      "Go to greeen",
                      style: styles.whiteRegular11,
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(Assets.image.manProfile.path),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
