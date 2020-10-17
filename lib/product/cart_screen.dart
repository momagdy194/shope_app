import 'package:flutter/material.dart';
import 'package:max_shope/provider/card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _logic = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart shope"),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total"),
                Spacer(),
                Chip(label: Text(_logic.totalAmount.toString())),
                FlatButton(onPressed: () {}, child: Text('Check Now'))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                child: Row(
                  children: [
//                    Text(_logic.items.length.toString()),

                    CircleAvatar(
                      radius: 25,
                      child: Text(
                        _logic.items.values.toList()[index].price.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),

                    Column(
                      children: [
                        Text(_logic.items.values
                            .toList()[index]
                            .title
                            .toString()),
                        Text(
                            "total ${double.parse(_logic.items.values.toList()[index].price.toString()) * double.parse(_logic.items.values.toList()[index].quantity.toString())}"),
                      ],
                    ),
                    Spacer(),
                    Text("x ${_logic.items.values.toList()[index].quantity}")
                  ],
                ),
              ),
              itemCount: _logic.items.length,
            ),
          )
        ],
      ),
    );
  }
}
