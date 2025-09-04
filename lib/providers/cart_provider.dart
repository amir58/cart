import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart_item.dart';
import '../models/cart_state.dart';
import '../models/product.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return const CartState();
  }

  void addProduct(Product product) {
    final existingItemIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      // Product already exists, increment quantity
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingItemIndex] =
          updatedItems[existingItemIndex].copyWith(
            quantity: updatedItems[existingItemIndex].quantity + 1,
          );
      _updateCart(updatedItems);
    } else {
      // Add new product to cart
      final newItem = CartItem(product: product, quantity: 1);
      final updatedItems = [...state.items, newItem];
      _updateCart(updatedItems);
    }
  }

  void removeProduct(String productId) {
    final updatedItems = state.items
        .where((item) => item.product.id != productId)
        .toList();
        
    _updateCart(updatedItems);
  }

  void updateQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      removeProduct(productId);
      return;
    }

    final updatedItems = state.items.map((item) {
      if (item.product.id == productId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    _updateCart(updatedItems);
  }

  void incrementQuantity(String productId) {
    final existingItem = state.items.firstWhere(
      (item) => item.product.id == productId,
      orElse: () => throw Exception('Product not found in cart'),
    );
    updateQuantity(productId, existingItem.quantity + 1);
  }

  void decrementQuantity(String productId) {
    final existingItem = state.items.firstWhere(
      (item) => item.product.id == productId,
      orElse: () => throw Exception('Product not found in cart'),
    );
    updateQuantity(productId, existingItem.quantity - 1);
  }

  void clearCart() {
    state = const CartState();
  }

  void _updateCart(List<CartItem> items) {
    final totalPrice = items.fold(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );
    state = CartState(items: items, totalPrice: totalPrice);
  }
}

final cartProvider = NotifierProvider<CartNotifier, CartState>(() {
  return CartNotifier();
});
