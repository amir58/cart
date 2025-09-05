# E-Commerce Flutter App

A complete e-commerce mobile application built with Flutter, featuring authentication, product browsing, cart management, and order history.

## Features

### ✅ Authentication
- **Sign In Screen**: Email and password authentication
- **Sign Up Screen**: User registration with full name
- **Persistent Login**: Users remain signed in using local storage
- **Logout**: Secure logout functionality

### ✅ Product Management
- **Product List**: Browse all products with search functionality
- **Product Details**: View individual product information
- **Search**: Real-time product search by name
- **Categories**: Product categorization

### ✅ Cart System
- **Add to Cart**: Add products with quantity selection
- **Cart Management**: Update quantities, remove items
- **Total Calculation**: Real-time price calculation
- **Checkout**: Complete order placement with confirmation

### ✅ Order History
- **Order Tracking**: View all past orders
- **Order Details**: Detailed order information
- **Order Status**: Track order completion status

### ✅ Navigation
- **Drawer Navigation**: Side drawer for easy access
- **Named Routes**: Clean URL-based navigation
- **Deep Linking**: Support for direct navigation

## Technical Architecture

### State Management
- **Riverpod**: Modern state management with providers
- **NotifierProvider**: For cart and UI state
- **AsyncNotifierProvider**: For loading product data
- **Provider**: For simple stateless objects

### Data Layer
- **Repository Pattern**: Clean separation of data sources
- **Local Storage**: SharedPreferences for user session and cart
- **API Integration**: DummyJSON API for product data
- **Feature-based Structure**: Organized by business domains

### UI/UX
- **Material Design 3**: Modern Material Design components
- **Responsive Layout**: Adaptive to different screen sizes
- **Loading States**: Proper loading and error handling
- **Custom Components**: Reusable UI components

## Project Structure

```
lib/
├── core/
│   ├── constants/          # App constants and configuration
│   ├── services/           # Core services (router, storage)
│   └── utils/              # Utility functions
├── features/
│   ├── auth/               # Authentication feature
│   │   ├── models/         # User model
│   │   ├── providers/      # Auth state management
│   │   ├── repositories/   # Auth data layer
│   │   └── views/          # Sign in/up screens
│   ├── products/           # Product management
│   │   ├── models/         # Product model
│   │   ├── providers/      # Product state management
│   │   ├── repositories/   # Product data layer
│   │   └── views/          # Product screens
│   ├── cart/               # Shopping cart
│   │   ├── models/         # Cart item model
│   │   ├── providers/      # Cart state management
│   │   ├── repositories/   # Cart data layer
│   │   └── views/          # Cart screen
│   └── orders/             # Order management
│       ├── models/         # Order model
│       ├── providers/      # Order state management
│       ├── repositories/   # Order data layer
│       └── views/          # Order history screen
└── shared/
    ├── widgets/            # Reusable UI components
    └── theme/              # App theming
```

## Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd cart
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Demo Credentials
- **Email**: test@example.com
- **Password**: password123

## API Integration

The app integrates with the DummyJSON API for product data:
- **Products**: https://dummyjson.com/products
- **Search**: https://dummyjson.com/products/search
- **Categories**: https://dummyjson.com/products/categories

## Dependencies

### Core Dependencies
- `flutter_riverpod`: State management
- `go_router`: Navigation
- `http`: API requests
- `shared_preferences`: Local storage
- `cached_network_image`: Image caching
- `intl`: Internationalization

### Development Dependencies
- `flutter_lints`: Code analysis
- `build_runner`: Code generation

## Features Implementation

### Authentication Flow
1. User enters credentials on Sign In screen
2. Mock authentication validates credentials
3. User session stored locally using SharedPreferences
4. Automatic redirect to home screen on success
5. Persistent login across app restarts

### Product Browsing
1. Fetch products from DummyJSON API
2. Display in responsive grid layout
3. Real-time search functionality
4. Navigate to product details on tap
5. Add products to cart from detail screen

### Cart Management
1. Add/remove products with quantity controls
2. Real-time total calculation
3. Persistent cart storage
4. Checkout process with order creation
5. Success confirmation dialog

### Order History
1. Store orders locally after checkout
2. Display order list with details
3. Show order status and total
4. Filter orders by user

## Future Enhancements

- [ ] Firebase Authentication integration
- [ ] Real payment processing
- [ ] Push notifications
- [ ] Offline support
- [ ] User profiles
- [ ] Wishlist functionality
- [ ] Product reviews and ratings
- [ ] Order tracking
- [ ] Multi-language support

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.