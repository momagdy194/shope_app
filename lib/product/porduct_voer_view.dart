import 'package:flutter/material.dart';
import 'package:max_shope/product/cart_screen.dart';
import 'file:///C:/Users/ELmohannd/AndroidStudioProjects/max_shope/lib/widget/badge.dart';
import 'package:max_shope/provider/card.dart';
import 'package:max_shope/provider/products.dart';
import 'package:max_shope/widget/produt_item.dart';
import 'package:provider/provider.dart';

enum filterOption {
  showFav,
  showAll,
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    var _logic = Provider.of<Products>(context);
    var _logicCart = Provider.of<Cart>(context);
    var _product = _isFav ? _logic.showFavOnly : _logic.item;
    return Scaffold(
      appBar: AppBar(
        title: Text(_logic.showFavOnly.length.toString()),
        actions: [
          PopupMenuButton(
            onSelected: (filterOption value) {
              setState(() {
                if (value == filterOption.showFav) {
                  _isFav = true;
                } else {
                  _isFav = false;
                }
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('favotiet'),
                  value: filterOption.showFav,
                ),
                PopupMenuItem(
                  child: Text('all product'),
                  value: filterOption.showAll,
                ),
              ];
            },
          ),
          Badge(
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ));
                  }),
              value: _logicCart.itemsCount.toString())
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 2,
            childAspectRatio: 3 / 2),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: _product[index],
          child: ProductItem(
//            id: _product[index].id,
//            title: _product[index].title,
//            description: _product[index].description,
//            imageUrl: _product[index].imageUrl,
//            price: _product[index].price,
              ),
        ),
        itemCount: _product.length,
      ),
    );
  }
}
