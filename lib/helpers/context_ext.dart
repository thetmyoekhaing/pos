import 'package:flutter/material.dart';

extension RouteExtension on BuildContext {
  void push(Widget widget) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void pop() {
    Navigator.pop(this);
  }
}
