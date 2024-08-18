import 'package:flutter/material.dart';

import '../../res/app_theme.dart';
import '../others/sized_boxes.dart';

class DropDownFormField extends StatelessWidget {
  final String titleText;
  final String hintText;
  final bool? required;
  final String? errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function(dynamic)? onChanged;
  final Function()? onCancel;
  final bool? filled;
  final EdgeInsets? contentPadding;
  final bool isEnabled;

  const DropDownFormField(
      {Key? key,
      required this.titleText,
      required this.hintText,
      this.required,
      this.errorText,
      this.value,
      required this.dataSource,
      required this.textField,
      required this.valueField,
      this.onChanged,
      this.filled,
      this.contentPadding,
      this.isEnabled = true,
      this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputDecorator(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                labelText: titleText,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<dynamic>(
                  icon: Row(
                    children: [
                      Icon(Icons.arrow_drop_down),
                      SizeBoxWidth8(),
                      InkWell(
                        onTap: onCancel,
                        child: Icon(Icons.clear, size: 18.0),
                      ),
                    ],
                  ),
                  hint: Text(hintText),
                  isExpanded: true,
                  isDense: true,
                  value: value == '' ? null : value,
                  onChanged: isEnabled == true ? onChanged : null,
                  dropdownColor: Colors.white,
                  items: dataSource.map((item) {
                    return DropdownMenuItem<dynamic>(
                      value: item[valueField],
                      child: Text(item[textField], overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
