import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;

  const BlaButton({
    super.key,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: type == ButtonType.primary
            ? BlaColors.primary
            : BlaColors.white,
        foregroundColor: type == ButtonType.primary
            ? BlaColors.white
            : BlaColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
          side: type == ButtonType.primary
              ? BorderSide.none
              : BorderSide(color: BlaColors.greyLight),
        ),
        padding: EdgeInsets.all(BlaSpacings.m),
        iconColor: type == ButtonType.primary
            ? BlaColors.white
            : BlaColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon), 
            SizedBox(width: BlaSpacings.s)
          ],
          Text(text),
        ],
      ),
    );
  }
}
