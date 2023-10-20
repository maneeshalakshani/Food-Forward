import 'package:food_forward/routes/routes.gr.dart';

class ScrollItem{
  late String imageURL;
  late String name;
  late var route;

  ScrollItem({required this.imageURL, required this.name, required this.route});
}

List<ScrollItem> horizontalScrollList = [
  ScrollItem(imageURL: 'assets/bar.png', name: "Stats", route: const MyStatsRoute()),
  ScrollItem(imageURL: "assets/tickMark.png", name: "Badges", route: null),
  ScrollItem(imageURL: 'assets/tips.png', name: "Tips", route: const TipsRoute()),
];