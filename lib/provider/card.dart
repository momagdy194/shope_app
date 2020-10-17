import 'package:flutter/foundation.dart';
import 'package:max_shope/model/card_item.dart';

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemsCount => _items.length;

  double get totalAmount {
    double _total = 0.0;
    _items.forEach((key, value) {
      _total += value.price * value.quantity;
    });
    return _total;
  }

  double get totalsingleProduct{
    var total;
    items.forEach((key, value) {
      total=value.price*value.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
              (value) =>
              CartItem(
                  id: value.id,
                  title: value.title,
                  price: value.price,
                  quantity: value.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
              () =>
              CartItem(
                  id: DateTime.now().toString(),
                  title: title,
                  price: price,
                  quantity: 1));
    }
    notifyListeners();
  }
}
