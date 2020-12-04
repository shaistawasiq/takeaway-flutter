import 'package:flutter/cupertino.dart';

import 'Item.dart';

class Cart extends ChangeNotifier{
  List<Item> _items = [];
  double _totalPrice = 0.0;


  void addItems( Item item){
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void removeItems(Item item){
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Item> get basketItems {
    return _items;
  }


}