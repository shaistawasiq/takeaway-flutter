import 'package:flutter/cupertino.dart';
import 'package:foodes/Models/CartItemDetails.dart';

class FoodCart extends ChangeNotifier{
  List<FoodItemsList> _foodItemsList=[];
  double _totalPrice = 0.0;

  void addFoodItems(FoodItemsList foodItemsList){
    _foodItemsList.add(foodItemsList);
    _totalPrice += foodItemsList.foodPrice;
    notifyListeners();
  }

  void removeFoodItems(FoodItemsList foodItemsList){
    _foodItemsList.remove(foodItemsList);
    _totalPrice -= foodItemsList.foodPrice;
    notifyListeners();
  }

  int get count{
    return _foodItemsList.length;
  }

  double get totalPrice{
    return _totalPrice;
  }

  List<FoodItemsList> get foodItemBasket{
    return _foodItemsList;
  }
}