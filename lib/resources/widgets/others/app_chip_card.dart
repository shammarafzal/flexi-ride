import 'package:flutter/material.dart';

import '../../res/app_theme.dart';
import 'app_text.dart';

class AppChipCard extends StatefulWidget {
  final String title;
  final double? fontSize;
  final bool? isSelected;

  const AppChipCard({Key? key, required this.title, this.isSelected, this.fontSize = 14.0}) : super(key: key);

  @override
  State<AppChipCard> createState() => _AppChipCardState();
}

class _AppChipCardState extends State<AppChipCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 6.0, bottom: 6.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppTheme.primaryColor),
          borderRadius: BorderRadius.circular(60.0),
          // color: widget.isSelected == true ? AppTheme.primaryColor : null),
          color: AppTheme.whiteLightColor,
        ),
        child: AppText(
          widget.title,
          size: widget.fontSize!,
          color: Colors.grey,
          bold: true,
        ),
      ),
    );
  }
}
