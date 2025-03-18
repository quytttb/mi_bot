import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const InputBar({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Ask me anything...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: SvgPicture.asset('assets/images/send_icon.svg'),
              onPressed: onSend,
            ),
          ),
        ],
      ),
    );
  }
}