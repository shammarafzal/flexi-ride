import 'package:flutter/material.dart';
import '../../res/app_theme.dart';

class AppBackButton extends StatefulWidget {
  final Function? onTap;
  final bool backButtonDisable;
  final IconData icon;
  final double blurRadius;
  final double spreadRadius;
  final Color shadowColor;

  const AppBackButton({
    Key? key,
    this.onTap,
    this.backButtonDisable = false,
    this.blurRadius = 0.0,
    this.spreadRadius = 0.0,
    this.shadowColor = Colors.white,
    required this.icon,
  }) : super(key: key);

  @override
  State<AppBackButton> createState() => _AppBackButtonState();
}

class _AppBackButtonState extends State<AppBackButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (!widget.backButtonDisable && widget.onTap != null) widget.onTap!();
        },
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor,
                blurRadius: widget.blurRadius,
                spreadRadius: widget.spreadRadius,
                //offset: Offset(5.0, 5.0), // shadow direction: bottom right
              )
            ],
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: widget.icon == Icons.menu
              ? Icon(
                  widget.icon,
                  size: 22,
                  color: AppTheme.primaryDarkColor,
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    widget.icon,
                    size: 22,
                    color: AppTheme.primaryDarkColor,
                  ),
                ),
        ),
      ),
    );
  }
}

class AppNotifyButton extends StatefulWidget {
  final Function? onTap;
  final bool notificationButtonDisable;
  final IconData icon;
  final double blurRadius;
  final double spreadRadius;
  final Color shadowColor;
  final Widget? child;

  const AppNotifyButton({
    Key? key,
    this.onTap,
    this.notificationButtonDisable = false,
    this.blurRadius = 0.0,
    this.spreadRadius = 0.0,
    this.shadowColor = Colors.white,
    this.icon = Icons.add,
    this.child,
  }) : super(key: key);

  @override
  State<AppNotifyButton> createState() => _AppNotifyButtonState();
}

class _AppNotifyButtonState extends State<AppNotifyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (!widget.notificationButtonDisable && widget.onTap != null) widget.onTap!();
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor,
                blurRadius: widget.blurRadius,
                spreadRadius: widget.spreadRadius,
              )
            ],
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                widget.icon,
                size: 25.0,
                color: AppTheme.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                child: CircleAvatar(
                  radius: 5.0,
                  backgroundColor: AppTheme.secondaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
