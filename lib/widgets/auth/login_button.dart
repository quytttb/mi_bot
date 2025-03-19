import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';

class LoginButton extends ConsumerWidget {
  final double buttonHeight;

  const LoginButton({super.key, required this.buttonHeight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authProvider);

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () => authController.login(context),
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
