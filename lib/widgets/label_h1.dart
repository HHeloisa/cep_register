import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/colors.dart';
import 'package:flutter/material.dart';

class LabelH1 extends StatelessWidget {
  const LabelH1({super.key, required this.label, this.color, this.textAlign});

  final String label;
  final TextAlign? textAlign;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: Breakpoints.b24,
          color: color ?? CustonColors.textColor,
          fontWeight: FontWeight.w500,
        ));
  }
}
