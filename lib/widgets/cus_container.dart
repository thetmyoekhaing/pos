import 'package:flutter/material.dart';

class CusContainer extends StatelessWidget {
  final String title;
  const CusContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(title),
    );
  }
}
