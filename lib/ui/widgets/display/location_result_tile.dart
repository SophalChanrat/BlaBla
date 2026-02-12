import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationResultTile extends StatelessWidget {
  final Location location;
  final VoidCallback onPressed;

  const LocationResultTile({super.key, required this.location, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(
        location.name,
        style: BlaTextStyles.body.copyWith(color: BlaColors.neutral),
      ),
      subtitle: Text(
        location.country.name,
        style: BlaTextStyles.label.copyWith(color: BlaColors.disabled),
      ),
      trailing: Icon(Icons.chevron_right, color: BlaColors.disabled,),
    );
  }
}
