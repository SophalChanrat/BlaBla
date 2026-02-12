import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaSwitchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BlaSwitchButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.swap_vert),
      color: BlaColors.iconLight,
    );
  }
}
