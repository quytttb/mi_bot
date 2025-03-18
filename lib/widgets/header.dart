import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const Header({
    super.key,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/images/menu_icon.svg'),
          onPressed: onMenuPressed,
        ),
        const Expanded(
          child: Center(
            child: Text(
              'New chat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        IconButton(
          icon: SvgPicture.asset('assets/images/search_icon.svg'),
          onPressed: () {
            // TODO: Handle search event
          },
        ),
      ],
    );
  }
}