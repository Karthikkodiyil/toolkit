import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        builder: (context, homepageViewModel, child) => SearchAnchor.bar(
            viewConstraints: BoxConstraints(
                maxHeight: homepageViewModel.setSearchListHeight()),
            barHintText: "Search...",
            //    barHintStyle: styles.blackRegular11,
            suggestionsBuilder: (context, searchController) {
              homepageViewModel.searchFunction(searchController.text);
              return homepageViewModel.searchToolList
                  .map((tool) => ListTile(
                        title: Text(tool.name ?? ""),
                      ))
                  .toList();
            }));
  }
}
