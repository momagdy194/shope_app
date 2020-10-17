import 'package:flutter/material.dart';
import 'file:///C:/Users/ELmohannd/AndroidStudioProjects/max_shope/lib/provider/product.dart';
import 'package:max_shope/product/productDetails.dart';
import 'package:max_shope/provider/card.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
//  final id, title, description, price, imageUrl;
//
//  ProductItem(
//      {this.id, this.title, this.description, this.price, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var _logic = Provider.of<Product>(context);
    var _logicCart = Provider.of<Cart>(context);
    return GridTile(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                id: _logic.id,
                title: _logic.title,
                description: _logic.description,
                imageUrl: _logic.imageUrl,
                price: _logic.price,
              ),
            )),
        child: Image(
          image: NetworkImage(_logic.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      footer: Container(
        color: Colors.black45,
        child: GridTileBar(
          title: Text(_logic.title),
          leading: IconButton(
              icon: Icon(
                _logic.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                _logic.toggalFav();
              }),
          trailing: IconButton(
              icon: Icon(Icons.shop),
              onPressed: () {
                _logicCart.addItem(_logic.id, _logic.title, _logic.price);
              }),
        ),
      ),
    );
  }
}
