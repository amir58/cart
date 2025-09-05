import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../../../core/constants/app_constants.dart';

class ProductsRepository {
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.productsEndpoint}',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> productsJson = data['products'] ?? [];

        return productsJson
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        throw Exception(AppConstants.networkError);
      }
    } catch (e) {
      throw Exception(AppConstants.networkError);
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.searchEndpoint}?q=$query',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> productsJson = data['products'] ?? [];

        return productsJson
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        throw Exception(AppConstants.networkError);
      }
    } catch (e) {
      throw Exception(AppConstants.networkError);
    }
  }

  Future<List<String>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.categoriesEndpoint}',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> categoriesJson = json.decode(
          response.body,
        );
        return categoriesJson
            .map((category) => category.toString())
            .toList();
      } else {
        throw Exception(AppConstants.networkError);
      }
    } catch (e) {
      throw Exception(AppConstants.networkError);
    }
  }

  Future<Product?> getProductById(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.productsEndpoint}/$id',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Product.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
