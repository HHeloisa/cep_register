import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class HistoryTable extends StatelessWidget {
  const HistoryTable({this.history, super.key});

  final List<CepModel>? history;
  @override
  Widget build(BuildContext context) {
    return history != null && history!.isNotEmpty
        ? DataTable(
            columns: const [
                DataColumn(label: Text(cepColumn)),
                DataColumn(label: Text(streetColumn)),
                DataColumn(label: Text(cityColumn)),
                DataColumn(label: Text(stateColumn)),
              ],
            rows: history!.map((cep) {
              return DataRow(
                cells: [
                  DataCell(Text(cep.CEP.toString())),
                  DataCell(Text(cep.logradouro.toString())),
                  DataCell(Text(cep.localidade.toString())),
                  DataCell(Text(cep.uf.toString())),
                ],
              );
            }).toList())
        : const Padding(
            padding: EdgeInsets.only(top: Breakpoints.b8),
            child: Center(child: LabelH2(label: noHistory)),
          );
  }
}
