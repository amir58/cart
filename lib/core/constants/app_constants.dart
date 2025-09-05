class AppConstants {
  // API Endpoints
  static const String baseUrl = 'https://dummyjson.com';
  static const String productsEndpoint = '/products';
  static const String searchEndpoint = '/products/search';
  static const String categoriesEndpoint = '/products/categories';

  // Local Storage Keys
  static const String userSessionKey = 'user_session';
  static const String cartKey = 'cart_items';
  static const String ordersKey = 'user_orders';

  // App Routes
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String homeRoute = '/home';
  static const String productDetailRoute = '/product-detail';
  static const String cartRoute = '/cart';
  static const String orderHistoryRoute = '/order-history';

  // Error Messages
  static const String networkError =
      'Network error. Please check your connection.';
  static const String unknownError = 'An unknown error occurred.';
  static const String invalidCredentials =
      'Invalid email or password.';
  static const String emailAlreadyExists = 'Email already exists.';
  static const String weakPassword =
      'Password should be at least 6 characters.';
  static const String invalidEmail =
      'Please enter a valid email address.';

  // Success Messages
  static const String loginSuccess = 'Login successful!';
  static const String signupSuccess = 'Account created successfully!';
  static const String logoutSuccess = 'Logged out successfully!';
  static const String checkoutSuccess = 'Order placed successfully!';
  static const String itemAddedToCart = 'Item added to cart!';
  static const String itemRemovedFromCart = 'Item removed from cart!';
}
