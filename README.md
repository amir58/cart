# Shopping Cart App

A Flutter shopping cart application built with Riverpod for state management.

## Features

### Cart Management
- **Add to Cart**: Users can add products to cart from the Product Detail screen
- **Quantity Control**: Users can increase/decrease quantity of each product in the cart
- **Total Price**: Displays total price before payment
- **Checkout**: Checkout button triggers a success dialog
- **Cart Persistence**: Cart state is maintained using Riverpod state management

### State Management
- **NotifierProvider**: Used for synchronous state (cart management)
- **AsyncNotifierProvider**: Used for loading products asynchronously
- **Real-time Updates**: Cart updates are reflected immediately across all screens

### Screens
1. **Product List Screen**: Displays all available products in a grid layout
2. **Product Detail Screen**: Shows detailed product information with add to cart functionality
3. **Cart Screen**: Shows all cart items with quantity controls and checkout option

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- `flutter_riverpod`: State management
- `http`: HTTP requests (for future API integration)

## Architecture

The app follows a clean architecture pattern with:
- **Models**: Product, CartItem, CartState
- **Providers**: CartNotifier, ProductsNotifier
- **Screens**: ProductListScreen, ProductDetailScreen, CartScreen

## Usage

1. Browse products on the main screen
2. Tap on a product to view details
3. Add products to cart with quantity controls
4. View cart by tapping the cart icon
5. Adjust quantities or remove items from cart
6. Proceed to checkout for a success confirmation
