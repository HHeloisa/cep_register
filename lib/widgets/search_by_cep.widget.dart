import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class SearchByCEP extends StatelessWidget {
  SearchByCEP({required this.getCep, super.key});
  final Function getCep;

  var cepController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const LabelH2(label: cepString),
        const SizedBox(width: Breakpoints.b8),
        Expanded(
          child: TextFormField(
            maxLength: 8,
            keyboardType: TextInputType.number,
            controller: cepController,
            onChanged: (String value) async {
              if (value.trim().length == 8) {
                FocusScope.of(context).unfocus();

                getCep(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
