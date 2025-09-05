import '../models/user.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/services/realm_service.dart';

class AuthRepository {
  final LocalStorageService _storageService =
      LocalStorageService.instance;

  // Mock authentication - in real app, this would call Firebase Auth
  Future<User?> signIn(String email, String password) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock validation - in real app, this would be Firebase Auth
      if (email == 'test@example.com' && password == 'password123') {
        final user = User(
          id: '1',
          email: email,
          fullName: 'Test User',
          password: password,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await _storageService.saveUser(user);
        return user;
      }

      return null;
    } catch (e) {
      throw Exception(AppConstants.unknownError);
    }
  }

  Future<User?> signUp(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock validation - in real app, this would be Firebase Auth
      if (email.isNotEmpty &&
          password.length >= 6 &&
          fullName.isNotEmpty) {
        final user = User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          email: email,
          fullName: fullName,
          password: password,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await _storageService.saveUser(user);
        return user;
      }

      return null;
    } catch (e) {
      throw Exception(AppConstants.unknownError);
    }
  }

  Future<void> signOut() async {
    await _storageService.clearUser();
  }

  Future<User?> getCurrentUser() async {
    return await _storageService.getCurrentUser();
  }

  Future<bool> isSignedIn() async {
    return await _storageService.getCurrentUser() != null;
  }
}
