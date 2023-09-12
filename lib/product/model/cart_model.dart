import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avocado', '4.00', 'assets/avocado.png', Colors.green],
    ['Banana', '30.00', 'assets/banana.png', Colors.yellow],
    ['Chicken', '12.00', 'assets/chicken.png', Colors.brown],
    ['Water', '14.00', 'assets/water.png', Colors.blue],
  ];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  final List _cartItems = [];

  void addToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}
