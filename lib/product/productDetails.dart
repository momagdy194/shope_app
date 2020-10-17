import 'package:flutter/material.dart';
import 'package:max_shope/provider/products.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final id, title, description, price, imageUrl;

  ProductDetails(
      {this.id, this.title, this.description, this.price, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var _logic = Provider.of<Products>(context).findById(id);

    return Scaffold(
      body: Column(
        children: [Image.network(_logic.imageUrl)],
      ),
    );
  }
}
