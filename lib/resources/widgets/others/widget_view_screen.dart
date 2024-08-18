import 'package:flutter/material.dart';

class WidgetViewScreen extends StatelessWidget {
  final String title;
  final Widget widget;

  WidgetViewScreen({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: widget,
        ),
      ),
    );
  }
}
