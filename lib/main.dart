import 'package:flutter/material.dart';
import 'package:max_shope/provider/card.dart';
import 'package:max_shope/provider/products.dart';
import 'package:provider/provider.dart';

import 'product/porduct_voer_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductsOverViewScreen(),
        ));
  }
}
