import '../../cart/models/cart_item.dart';

class Order {
  final String id;
  final String userId;
  final List<String> productIds;
  final List<int> quantities;
  final List<double> prices;
  final double totalPrice;
  final DateTime createdAt;
  final String status;

  Order({
    required this.id,
    required this.userId,
    required this.productIds,
    required this.quantities,
    required this.prices,
    required this.totalPrice,
    required this.createdAt,
    required this.status,
  });

  factory Order.fromCartItems({
    required String id,
    required String userId,
    required List<CartItem> cartItems,
  }) {
    return Order(
      id: id,
      userId: userId,
      productIds: cartItems.map((item) => item.product.id).toList(),
      quantities: cartItems.map((item) => item.quantity).toList(),
      prices: cartItems.map((item) => item.product.price).toList(),
      totalPrice: cartItems.fold(
        0.0,
        (sum, item) => sum + item.totalPrice,
      ),
      createdAt: DateTime.now(),
      status: 'completed',
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      productIds: List<String>.from(json['productIds'] ?? []),
      quantities: List<int>.from(json['quantities'] ?? []),
      prices: List<double>.from(json['prices'] ?? []),
      totalPrice: (json['totalPrice'] ?? 0.0).toDouble(),
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      status: json['status'] ?? 'completed',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productIds': productIds,
      'quantities': quantities,
      'prices': prices,
      'totalPrice': totalPrice,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
    };
  }

  Order copyWith({
    String? id,
    String? userId,
    List<String>? productIds,
    List<int>? quantities,
    List<double>? prices,
    double? totalPrice,
    DateTime? createdAt,
    String? status,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      productIds: productIds ?? this.productIds,
      quantities: quantities ?? this.quantities,
      prices: prices ?? this.prices,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }
}
