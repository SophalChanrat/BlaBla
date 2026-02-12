import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onCleared;

  const LocationSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onCleared,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(BlaSpacings.m),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Search Location",
          filled: true,
          contentPadding: EdgeInsets.all(BlaSpacings.s),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
            borderSide: BorderSide.none,
          ),
          prefixIcon: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, size: BlaTextStyles.body.fontSize),
          ),
          prefixIconColor: BlaColors.neutral,
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(onPressed: onCleared, icon: Icon(Icons.close))
              : null,
        ),
      ),
    );
  }
}
