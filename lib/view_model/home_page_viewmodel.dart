import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:toolkit/model/tools_model.dart';

class HomePageViewmodel extends ChangeNotifier {
  final List<bool> _isMoreText =
      List.generate(toolList.length, (int index) => false);
  List<bool> get isMoreText => _isMoreText;

  List<ToolsModel> _searchToolList = [];
  List<ToolsModel> get searchToolList => _searchToolList;

  bool _isSideBar = false;
  bool get isSideBar => _isSideBar;

  bool _isAllTool = true;
  bool get isAllTool => _isAllTool;

  bool _isAgriTool = false;
  bool get isAgriTool => _isAgriTool;

  bool _isKitchenTool = false;
  bool get isKitchenTool => _isKitchenTool;

  bool _isGardenTool = false;
  bool get isGardenTool => _isGardenTool;

  bool _isCategory = false;
  bool get isCategory => _isCategory;

  bool _isContact = false;
  bool get isContact => _isContact;

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

  void toggleSideBar() {
    _isSideBar = !_isSideBar;
    _isCategory = false;
    _isContact = false;
    notifyListeners();
  }

  void toggleCategory() {
    _isCategory = !_isCategory;
    _isContact = false;
    notifyListeners();
  }

  void toggleContact() {
    _isContact = !_isContact;
    _isCategory = false;
    notifyListeners();
  }

  void selectCategory(String value) {
    if (value == "All") {
      _isAllTool = true;
      _isAgriTool = false;
      _isKitchenTool = false;
      _isGardenTool = false;
    }
    if (value == "Agri") {
      _isAllTool = false;
      _isAgriTool = true;
      _isKitchenTool = false;
      _isGardenTool = false;
    }
    if (value == "Kitchen") {
      _isAllTool = false;
      _isAgriTool = false;
      _isKitchenTool = true;
      _isGardenTool = false;
    }
    if (value == "Garden") {
      _isAllTool = false;
      _isAgriTool = false;
      _isKitchenTool = false;
      _isGardenTool = true;
    }
    notifyListeners();
  }
}
