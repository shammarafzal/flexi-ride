import 'package:flutter/material.dart';

import '../../res/app_theme.dart';
import '../button/app_button.dart';
import '../others/app_text.dart';
import '../others/sized_boxes.dart';


appCustomDialog(BuildContext classContext, IconData icon, String text, String buttonText, {required Function() onPressed}) async {
  return showDialog(
    context: classContext,
    barrierDismissible: true, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200.0),
            ),
            backgroundColor: AppTheme.secondaryColor,
            actions: <Widget>[
              Container(
                height: 590,
                width: 300,
                child: Column(
                  children: [
                    SizeBoxHeight64(),
                    CircleAvatar(
                      radius: 110,
                      backgroundColor: Color(0xFFFF5252),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Color(0xFFF66868),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Color(0xFFFF8585),
                          child: Icon(
                            icon,
                            color: AppTheme.whiteColor,
                            size: 70,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 32.0, right: 32.0, bottom: 40),
                      child: AppText(
                        text,
                        color: AppTheme.whiteColor,
                        size: 20,
                        alignText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppButton(text: buttonText, width: 200, btnColor: AppTheme.primaryDarkColor, onPressed: onPressed),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
