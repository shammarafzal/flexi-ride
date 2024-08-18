import 'package:flutter/material.dart';
import '../../res/app_theme.dart';
import '../others/sized_boxes.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Function? onPressed;
  final double width;
  final double height;
  final Color? btnColor;
  final bool disabled;
  final double textSize;
  final double borderRadius;
  final bool containerBoarder;
  final Color? containerBoarderColor;
  final IconData? icon;

  static Color PrimaryColorVariant = Color(0xFF1565C0);

  const AppButton({
    Key? key,
    required this.text,
    this.onPressed,
    required this.width,
    this.disabled = false,
    this.btnColor,
    this.textSize = 18.0,
    this.borderRadius = 12.0,
    this.height = 50.0,
    this.containerBoarder = false,
    this.textColor = Colors.white,
    this.containerBoarderColor = AppTheme.primaryDarkColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disabled && onPressed != null) onPressed!();
      },
      child: Container(
        decoration: BoxDecoration(
          border: containerBoarder != false ? Border.all(width: 1, color: containerBoarderColor!) : null,
          borderRadius: BorderRadius.circular(borderRadius),
          color: disabled
              ? Colors.grey
              : btnColor == null
                  ? AppTheme.primaryColor
                  : btnColor,
        ),
        height: height,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: textSize, color: textColor, fontWeight: FontWeight.bold),
              ),
              if (icon != null) ...[
                SizeBoxWidth8(),
                Icon(icon, size: 20.0, color: AppTheme.primaryColor),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
