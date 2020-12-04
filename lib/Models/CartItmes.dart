import 'dart:async';

class CartItemBloc{
  final cartStreamController = StreamController.broadcast();
  Stream get getStream =>cartStreamController.stream;
  final Map allItems = {
    'shop items': [
      {'name': 'App dev kit', 'price': 20, 'id': 1},
      {'name': 'App consultation', 'price': 100, 'id': 2},
      {'name': 'Logo Design', 'price': 10, 'id': 3},
      {'name': 'Code review', 'price': 90, 'id': 4},
    ],
    'cart items': []
  };
  /// [addToCart] adds items from the shop to the cart
  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  /// [removeFromCart] removes items from the cart, back to the shop
  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void dispose(){
    cartStreamController.close();
  }
  final bloc = CartItemBloc();  // add to the end of the file
}