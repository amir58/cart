import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';
import '../../products/models/product.dart';

class CartRepository {
  static const String _cartKey = 'cart_items';

  Future<List<CartItem>> getCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cartJson = prefs.getString(_cartKey);

      if (cartJson == null) return [];

      final List<dynamic> cartList = json.decode(cartJson);
      return cartList.map((item) => CartItem.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> saveCartItems(List<CartItem> cartItems) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String cartJson = json.encode(
        cartItems.map((item) => item.toJson()).toList(),
      );
      await prefs.setString(_cartKey, cartJson);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> addToCart(Product product, {int quantity = 1}) async {
    final cartItems = await getCartItems();
    final existingItemIndex = cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity += quantity;
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }

    await saveCartItems(cartItems);
  }

  Future<void> removeFromCart(String productId) async {
    final cartItems = await getCartItems();
    cartItems.removeWhere((item) => item.product.id == productId);
    await saveCartItems(cartItems);
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    final cartItems = await getCartItems();
    final existingItemIndex = cartItems.indexWhere(
      (item) => item.product.id == productId,
    );

    if (existingItemIndex != -1) {
      if (quantity <= 0) {
        cartItems.removeAt(existingItemIndex);
      } else {
        cartItems[existingItemIndex].quantity = quantity;
      }
      await saveCartItems(cartItems);
    }
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  Future<double> getTotalPrice() async {
    final cartItems = await getCartItems();
    double total = 0.0;
    for (final item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }

  Future<int> getTotalItems() async {
    final cartItems = await getCartItems();
    int total = 0;
    for (final item in cartItems) {
      total += item.quantity;
    }
    return total;
  }
}
