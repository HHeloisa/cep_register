import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:flutter/material.dart';

class TableAdressListOption extends StatelessWidget {
  const TableAdressListOption({required this.adressListOptions, super.key});
  final List<CepModel> adressListOptions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: const [
                  DataColumn(label: Text(cepColumn)),
                  DataColumn(label: Text(streetColumn)),
                  DataColumn(label: Text(cityColumn)),
                  DataColumn(label: Text(stateColumn)),
                  DataColumn(label: Text(neighborhoodColumn)),
                  DataColumn(label: Text(complementColumn)),
                ],
                rows: adressListOptions.map((cep) {
                  return DataRow(
                    cells: [
                      DataCell(Text(cep.CEP.toString())),
                      DataCell(Text(cep.logradouro.toString())),
                      DataCell(Text(cep.localidade.toString())),
                      DataCell(Text(cep.uf.toString())),
                      DataCell(Text(cep.bairro.toString())),
                      DataCell(Text(cep.complemento.toString())),
                    ],
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
