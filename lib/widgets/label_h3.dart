import 'package:flutter/material.dart';

class LabelH3 extends StatelessWidget {
  const LabelH3({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400));
  }
}
