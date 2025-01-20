import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/utils/app_colors.dart';
import 'package:toolkit/utils/components/size_config.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<HomePageViewmodel>(
        builder: (context, homepageViewModel, child) => Container(
              height: 40,
              width: SizeConfig.screenWidth * .9,
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search ..."),
              ),
            ));
  }
}



// SearchAnchor.bar(
//                   viewConstraints: BoxConstraints(
//                       maxHeight: homepageViewModel.setSearchListHeight()),
//                   barHintText: "Search...",
//                   //    barHintStyle: styles.blackRegular11,
//                   suggestionsBuilder: (context, searchController) {
//                     homepageViewModel.searchFunction(searchController.text);
//                     return homepageViewModel.searchToolList
//                         .map((tool) => ListTile(
//                               title: Text(tool.name ?? ""),
//                             ))
//                         .toList();
//                   }),