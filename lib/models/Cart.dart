import 'package:food_forward/models/CartItem.dart';

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
  }
}
