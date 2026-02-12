import 'package:blablacar/ui/theme/theme.dart';
import 'package:blablacar/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class BlaDateTile extends StatelessWidget {
  final DateTime date;
  final VoidCallback onPressed;

  const BlaDateTile({super.key, required this.date, required this.onPressed});

  String get formatedDate => DateTimeUtils.formatDateTime(date);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(Icons.calendar_month_outlined, color: BlaColors.iconLight),
      title: Text(
        formatedDate,
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutral),
      ),
    );
  }
}
