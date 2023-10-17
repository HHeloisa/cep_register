import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class CepNotFound extends StatelessWidget {
  const CepNotFound({required this.lastSearchedCep, super.key});

  final CepModel? lastSearchedCep;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          borderRadius:
              const BorderRadius.all(Radius.circular(Breakpoints.b16)),
        ),
        child: Padding(
            padding: const EdgeInsets.all(Breakpoints.b16),
            child: Column(children: const [
              LabelH2(label: cepNotFound),
            ])));
  }
}
