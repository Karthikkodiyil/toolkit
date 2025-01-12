import 'package:toolkit/utils/assets/assets.gen.dart';

class ToolsModel {
  String? img;
  String? name;
  String? prize;
  String? oldPrize;
  String? disc;

  ToolsModel({this.disc, this.img, this.name, this.oldPrize, this.prize});
}

List<ToolsModel> toolList = [
  ToolsModel(
    img: Assets.image.toolkitTools.path,
    name: "Abcd",
    prize: "389",
    oldPrize: "599",
    disc: "This was a all terrain agriculture tool that used to pluck grass and unwanted stones on the cultivating land that was highly realable and as well as good for your land ."
  ),
];
