import 'package:flutter/material.dart';
import 'package:foodes/Models/Cart.dart';
import 'package:foodes/Models/Item.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Item> items = [
    Item(title: 'Burger', price: 250.0),
    Item(title: 'Pasta', price: 300.0),
    Item(title: 'Pizza', price: 500.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Shopping Cart'),
            actions: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOut()));
                      })
                ],
              )
            ],
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index].title),
                trailing: Icon(
                  Icons.add,
                  size: 26.0,
                ),
                onTap: () {
                  cart.addItems(items[index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Checkout'),
            ),
            body: cart.basketItems == 0
                ? Center(child: Text('No items in cart!'))
                : ListView.builder(
                    itemCount: cart.basketItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(cart.basketItems[index].title),
                          trailing:
                              Text(cart.basketItems[index].price.toString()),
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
