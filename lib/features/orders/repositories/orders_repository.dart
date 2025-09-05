import '../models/order.dart';
import '../../cart/models/cart_item.dart';
import '../../../core/services/realm_service.dart';

class OrdersRepository {
  final LocalStorageService _storageService = LocalStorageService.instance;

  Future<Order> createOrder(String userId, List<CartItem> cartItems) async {
    try {
      final order = Order.fromCartItems(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: userId,
        cartItems: cartItems,
      );
      
      await _storageService.saveOrder(order);
      return order;
    } catch (e) {
      throw Exception('Failed to create order');
    }
  }

  Future<List<Order>> getUserOrders(String userId) async {
    return await _storageService.getUserOrders(userId);
  }

  Future<Order?> getOrderById(String orderId) async {
    try {
      final orders = await _storageService.getUserOrders('');
      return orders.where((order) => order.id == orderId).firstOrNull;
    } catch (e) {
      return null;
    }
  }

  Future<List<Order>> getAllOrders() async {
    return await _storageService.getUserOrders('');
  }

  Future<void> clearOrders() async {
    await _storageService.clearOrders();
  }
}
