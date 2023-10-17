import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/pages/edit_cep.page.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class SectionIten extends StatelessWidget {
  const SectionIten(
      {required this.cepModel, required this.deleteFunction, super.key});
  final CepModel cepModel;
  final Function deleteFunction;
  @override
  Widget build(BuildContext context) {
    final String referencia = cepModel.referencia!;
    final String cep = cepModel.CEP!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const LabelH2(label: reference),
                const SizedBox(
                  width: Breakpoints.b8,
                ),
                LabelH2(label: referencia)
              ],
            ),
            const SizedBox(
              height: Breakpoints.b8,
            ),
            Row(
              children: [
                const LabelH2(label: cepString),
                const SizedBox(
                  width: Breakpoints.b8,
                ),
                LabelH2(label: cep)
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditCepPage(cepModel: cepModel),
                    ),
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.grey, size: 20)),
            IconButton(
                onPressed: () async {
                  deleteFunction(cepModel);
                },
                icon: const Icon(Icons.delete, color: Colors.red, size: 20))
          ],
        ),
      ],
    );
  }
}
