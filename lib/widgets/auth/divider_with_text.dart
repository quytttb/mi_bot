import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or',
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
      ],
    );
  }
}