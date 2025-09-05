import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/views/sign_in_screen.dart';
import '../../features/auth/views/sign_up_screen.dart';
import '../../features/products/views/product_list_screen.dart';
import '../../features/products/views/product_detail_screen.dart';
import '../../features/cart/views/cart_screen.dart';
import '../../features/orders/views/order_history_screen.dart';
import '../constants/app_constants.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: authState.user != null
        ? AppConstants.homeRoute
        : AppConstants.loginRoute,
    redirect: (context, state) {
      final isLoggedIn = authState.user != null;
      final isLoggingIn =
          state.matchedLocation == AppConstants.loginRoute ||
          state.matchedLocation == AppConstants.signupRoute;

      if (!isLoggedIn && !isLoggingIn) {
        return AppConstants.loginRoute;
      }

      if (isLoggedIn && isLoggingIn) {
        return AppConstants.homeRoute;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppConstants.loginRoute,
        name: 'login',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppConstants.signupRoute,
        name: 'signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppConstants.homeRoute,
        name: 'home',
        builder: (context, state) => const ProductListScreen(),
      ),
      GoRoute(
        path: '${AppConstants.productDetailRoute}/:id',
        name: 'product-detail',
        builder: (context, state) {
          final productId = state.pathParameters['id']!;
          return ProductDetailScreen(productId: productId);
        },
      ),
      GoRoute(
        path: AppConstants.cartRoute,
        name: 'cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: AppConstants.orderHistoryRoute,
        name: 'order-history',
        builder: (context, state) => const OrderHistoryScreen(),
      ),
    ],
  );
});
