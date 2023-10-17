import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/colors.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/viewModel/cep.view_model.dart';
import 'package:cep_register/widgets/label_h1.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class ShowSearchedCep extends StatelessWidget {
  ShowSearchedCep({required this.cep, super.key});
  final CepModel cep;

  final TextEditingController referenciaController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    var estado = cep.uf ?? "";
    var endereco = cep.logradouro ?? "";
    var cidade = cep.localidade ?? "";
    return Container(
      decoration: const BoxDecoration(
        color: CustonColors.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(Breakpoints.b16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Breakpoints.b16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: LabelH2(label: endereco)),
            Padding(
              padding: const EdgeInsets.only(bottom: Breakpoints.b8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelH2(label: cidade),
                  const SizedBox(width: Breakpoints.b8),
                  LabelH2(label: estado)
                ],
              ),
            ),
            const SizedBox(width: Breakpoints.b32),
            const LabelH2(textAlign: TextAlign.start, label: addReference),
            const SizedBox(width: Breakpoints.b8),
            TextFormField(
              controller: referenciaController,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const LabelH2(
                  label: registerCep,
                ),
                onPressed: () {
                  if (referenciaController.text != "") {
                    FocusScope.of(context).unfocus();
                    cep.referencia = referenciaController.text;
                    CepViewModel().registerCEP(cep);
                    _showAlertDialog(
                        context, referenciaController.text, cep.CEP!);
                  } else {
                    _showAlertDialog(
                        context, referenciaController.text, cep.CEP!);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context, String reference, String cep) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const LabelH1(label: atention),
        content: LabelH2(
            label: reference.isEmpty
                ? needReference
                : "O cep $cep foi salvo com a referencia: $reference"),
        actions: <Widget>[
          ElevatedButton(
            child: const LabelH2(label: close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
