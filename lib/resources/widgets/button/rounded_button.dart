import 'package:flutter/material.dart';
import '../../res/app_theme.dart';

class RoundedButton extends StatelessWidget {
  final Function() onPressed;
  final double btnSize;
  final double iconSize;
  final bool disabled;
  final Color color;
  final Color boarderColor;

  final IconData icon;
  final Color iconColor;
  // final Double;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    this.disabled = false,
    this.btnSize = 40,
    this.iconSize = 26,
    this.color = Colors.blue,
    this.icon = Icons.arrow_forward_outlined,
    this.iconColor = Colors.white, this.boarderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: disabled ? Colors.grey : color,
          border: Border.all(
            color: boarderColor,
            width: 1.0,
          ),
        ),
        height: btnSize,
        width: btnSize,
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
