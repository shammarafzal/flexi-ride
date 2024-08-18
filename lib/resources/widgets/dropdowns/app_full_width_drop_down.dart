import 'package:flutter/material.dart';

import '../../res/app_theme.dart';
import '../others/app_text.dart';


class AppFullWidthDropDown<T> extends StatelessWidget {
  final String? hint;
  final String? label;
  final List<T>? items;
  final Function(T?)? onChange;
  final T? value;
  final TextStyle? valuesStyle;
  final bool disable;

  const AppFullWidthDropDown({
    Key? key,
    this.hint,
    this.label,
    this.items,
    this.onChange,
    this.value,
    this.valuesStyle,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0,left: 10.0,right: 10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: items!.isEmpty ? SizedBox() : AppText(label ?? '', size: 14, color: AppTheme.primaryDarkColor),
            ),
            DropdownButtonHideUnderline(
              child: ButtonTheme(
                minWidth: 20,
                //alignedDropdown: false,
                child: DropdownButton<T>(
                  isExpanded: true,
                  isDense: true,
                  hint: AppText(
                    hint ?? "",
                    color: AppTheme.primaryDarkColor,
                    size: 16,
                  ),
                  value: value,
                  items: items!.map((i) {
                    return DropdownMenuItem(
                      child: Text(i.toString(), style: TextStyle(fontSize: 16, color: AppTheme.primaryDarkColor)),
                      value: i,
                    );
                  }).toList(),
                  onChanged: onChange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
