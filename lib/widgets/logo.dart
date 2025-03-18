import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double iconSize;

  const Logo({
    super.key,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icon.png',
      width: iconSize,
      height: iconSize,
    );
  }
}
