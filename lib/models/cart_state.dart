import 'cart_item.dart';

class CartState {
  final List<CartItem> items;
  final double totalPrice;

  const CartState({this.items = const [], this.totalPrice = 0.0});

  CartState copyWith({List<CartItem>? items, double? totalPrice}) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  int get totalItems =>
      items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;

  bool get isNotEmpty => items.isNotEmpty;
}
