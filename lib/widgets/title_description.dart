import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/colors.dart';
import 'package:cep_register/widgets/label_h1.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class TitleDescription extends StatelessWidget {
  const TitleDescription(
      {super.key, required this.titulo, required this.descricao});

  final String titulo;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Padding(
            padding: const EdgeInsets.only(bottom: Breakpoints.b16),
            child: LabelH1(
              label: titulo,
              color: CustonColors.textColor,
            )),
      ),
      LabelH2(label: descricao),
    ]);
  }
}
