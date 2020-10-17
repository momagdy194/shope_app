import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier {
  final id, title, description, price, imageUrl;
  bool isFavorite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.isFavorite = false});

  void toggalFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
