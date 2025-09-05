import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/models/user.dart';
import '../../features/orders/models/order.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  SharedPreferences? _prefs;

  LocalStorageService._internal();

  static LocalStorageService get instance {
    _instance ??= LocalStorageService._internal();
    return _instance!;
  }

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // User operations
  Future<void> saveUser(User user) async {
    await _initPrefs();
    final userJson = json.encode(user.toJson());
    await _prefs!.setString('current_user', userJson);
  }

  Future<User?> getCurrentUser() async {
    await _initPrefs();
    final userJson = _prefs!.getString('current_user');
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  Future<void> clearUser() async {
    await _initPrefs();
    await _prefs!.remove('current_user');
  }

  // Order operations
  Future<void> saveOrder(Order order) async {
    await _initPrefs();
    final ordersJson = _prefs!.getString('orders') ?? '[]';
    final List<dynamic> orders = json.decode(ordersJson);
    orders.add(order.toJson());
    await _prefs!.setString('orders', json.encode(orders));
  }

  Future<List<Order>> getUserOrders(String userId) async {
    await _initPrefs();
    final ordersJson = _prefs!.getString('orders') ?? '[]';
    final List<dynamic> orders = json.decode(ordersJson);
    return orders
        .map((orderJson) => Order.fromJson(orderJson))
        .where((order) => order.userId == userId)
        .toList();
  }

  Future<void> clearOrders() async {
    await _initPrefs();
    await _prefs!.remove('orders');
  }
}
