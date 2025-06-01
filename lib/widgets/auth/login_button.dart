import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_bot/screens/home/home_screen.dart';
import '../../providers/auth_provider.dart';
import '../../services/auth_service.dart';
import '../../services/keycloak_service.dart';

class LoginButton extends ConsumerWidget {
  final double buttonHeight;

  const LoginButton({super.key, required this.buttonHeight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = AuthService();
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () async {
          // final keycloakService = KeycloakService();
          // await keycloakService.login(context, ref);
          // final result = await authService.signIn();
          // if (context.mounted) {
          //   if (result != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          //);
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text("Đăng nhập thất bại! Hãy thử lại.")),
          //   );
          // }
          //}
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[400],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Login 😀',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
