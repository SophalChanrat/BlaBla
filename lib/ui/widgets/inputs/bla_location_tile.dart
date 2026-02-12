import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum LocationType { departure, arrival }

class BlaLocationTile extends StatelessWidget {
  final Location? location;
  final LocationType type;
  final Widget? trailingIcon;
  final VoidCallback onPressed;

  const BlaLocationTile({
    super.key,
    required this.location,
    required this.type,
    this.trailingIcon,
    required this.onPressed,
  });

  String get title =>
      "${location?.name}${type == LocationType.arrival ? ", ${location?.country.name}" : ""}";

  String get placeHolder =>
      type == LocationType.arrival ? "Going to" : "Leaving from";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(Icons.radio_button_unchecked, color: BlaColors.iconLight),
      title: Text(
        location == null ? placeHolder : title,
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutral),
      ),
      trailing: location == null ? null : trailingIcon,
    );
  }
}
