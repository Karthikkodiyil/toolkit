import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:toolkit/model/tools_model.dart';

class HomePageViewmodel extends ChangeNotifier {
  List<bool> _isMoreText = List.generate(toolList.length, (int index) => false);
  List<bool> get isMoreText => _isMoreText;

  List<ToolsModel> _searchToolList = [];
  List<ToolsModel> get searchToolList => _searchToolList;

  void toggleMoreText(int index) {
    // _isMoreText.fillRange(0, toolList.length - 1,false);
    _isMoreText[index] = !_isMoreText[index];
    notifyListeners();
  }

  void searchFunction(String value) {
    log("hello");
    if (value.trim() == "" || value.isEmpty) {
      _searchToolList = [];
    } else {
      _searchToolList = toolList
          .where(
              (tool) => tool.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  double setSearchListHeight() {
    if (_searchToolList.length > 5) {
      return 250;
    } else {
      if (_searchToolList.isEmpty || _searchToolList == []) {
        return 25;
      } else {
        double value = _searchToolList.length * 25;
        return value;
      }
    }
  }
}
