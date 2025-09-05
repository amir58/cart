import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';
import '../repositories/cart_repository.dart';
import '../../products/models/product.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository();
});

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((
  ref,
) {
  final repository = ref.watch(cartRepositoryProvider);
  return CartNotifier(repository);
});

class CartState {
  final List<CartItem> items;
  final bool isLoading;
  final String? error;

  CartState({
    this.items = const [],
    this.isLoading = false,
    this.error,
  });

  double get totalPrice =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);
  int get totalItems =>
      items.fold(0, (sum, item) => sum + item.quantity);

  CartState copyWith({
    List<CartItem>? items,
    bool? isLoading,
    String? error,
  }) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class CartNotifier extends StateNotifier<CartState> {
  final CartRepository _repository;

  CartNotifier(this._repository) : super(CartState()) {
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    state = state.copyWith(isLoading: true);
    try {
      final items = await _repository.getCartItems();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> addToCart(Product product, {int quantity = 1}) async {
    try {
      await _repository.addToCart(product, quantity: quantity);
      await _loadCartItems();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      await _repository.removeFromCart(productId);
      await _loadCartItems();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    try {
      await _repository.updateQuantity(productId, quantity);
      await _loadCartItems();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> clearCart() async {
    try {
      await _repository.clearCart();
      state = state.copyWith(items: []);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
