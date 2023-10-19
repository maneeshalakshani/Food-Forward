import 'package:food_forward/const.dart';
import 'package:food_forward/routes/routes.gr.dart';

class ScrollItem{
  late String imageURL;
  late String name;
  late var route;

  ScrollItem({required this.imageURL, required this.name, required this.route});
}

List<ScrollItem> horizontalScrollList = [
  ScrollItem(imageURL: LOGO_URL, name: "Stats", route: const MyStatsRoute()),
  ScrollItem(imageURL: "assets/red.png", name: "Badges", route: null),
  ScrollItem(imageURL: LOGO_URL, name: "Tips", route: const TipsRoute()),
];