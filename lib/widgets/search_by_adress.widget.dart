import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class SearchByAdress extends StatelessWidget {
  SearchByAdress({required this.getCepByAdress, super.key});

  final Function getCepByAdress;

  TextEditingController ufController = TextEditingController(text: "");
  TextEditingController ruaController = TextEditingController(text: "");
  TextEditingController cidadeController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelH2(label: searchByAdress),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LabelH2(label: ufString),
            const SizedBox(width: Breakpoints.b8),
            Expanded(
              child: TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.streetAddress,
                controller: ufController,
                onChanged: (String value) async {},
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LabelH2(label: cityString),
            const SizedBox(width: Breakpoints.b8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: cidadeController,
                onChanged: (String value) async {},
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LabelH2(label: streetString),
            const SizedBox(width: Breakpoints.b8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: ruaController,
                onChanged: (String value) async {},
              ),
            ),
          ],
        ),
        const SizedBox(height: Breakpoints.b8),
        Center(
          child: ElevatedButton(
              child: const LabelH2(label: searchByAdress),
              onPressed: () {
                FocusScope.of(context).unfocus();
                getCepByAdress(ufController, ruaController, cidadeController);
              }),
        ),
      ],
    );
  }
}
