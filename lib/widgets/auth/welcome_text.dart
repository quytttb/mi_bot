import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final double fontSizeTitle;
  final double fontSizeSubtitle;

  const WelcomeText({
    super.key,
    required this.fontSizeTitle,
    required this.fontSizeSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back, HaiQuy',
          style: TextStyle(
            fontSize: fontSizeTitle,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Welcome back! Please enter your details.',
          style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}