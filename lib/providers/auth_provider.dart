import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider((ref) => AuthController());

class AuthController {
  void login(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name == '/login') {
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }
  void signUp(BuildContext context) {
    // Xử lý đăng ký
  }

  void loginWithGoogle(BuildContext context) {
    // Xử lý đăng nhập Google
  }

  void loginWithApple(BuildContext context) {
    // Xử lý đăng nhập Apple
  }
}