import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/order.dart';
import '../repositories/orders_repository.dart';
import '../../auth/providers/auth_provider.dart';

final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  return OrdersRepository();
});

final ordersProvider = FutureProvider<List<Order>>((ref) async {
  final repository = ref.watch(ordersRepositoryProvider);
  final authState = ref.watch(authStateProvider);

  if (authState.user == null) {
    return [];
  }

  return repository.getUserOrders(authState.user!.id);
});

final createOrderProvider =
    FutureProvider.family<Order, List<dynamic>>((
      ref,
      cartItems,
    ) async {
      final repository = ref.watch(ordersRepositoryProvider);
      final authState = ref.watch(authStateProvider);

      if (authState.user == null) {
        throw Exception('User not authenticated');
      }

      return await repository.createOrder(
        authState.user!.id,
        cartItems.cast(),
      );
    });
