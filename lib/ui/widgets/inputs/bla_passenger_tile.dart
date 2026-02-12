import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaPassengerTile extends StatelessWidget {
  final int numberOfPassenger;
  final VoidCallback onPressed;

  const BlaPassengerTile({super.key, required this.numberOfPassenger, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        Icons.person_2_outlined, color: BlaColors.iconLight,
      ),
      title: Text(
        numberOfPassenger.toString(),
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutral), 
      ),
    );
  }
}
