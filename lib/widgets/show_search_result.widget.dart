import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/widgets/show_searched_cep.widget.dart';
import 'package:cep_register/widgets/table_options.widget.dart';
import 'package:flutter/material.dart';

import 'cep_not_found.widget.dart';

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult(
      {required this.lastSearchedCep,
      required this.cepNotFound,
      required this.adressList,
      super.key});

  final CepModel? lastSearchedCep;
  final bool cepNotFound;
  final List<CepModel> adressList;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      lastSearchedCep != null && cepNotFound == false
          ? ShowSearchedCep(cep: lastSearchedCep!)
          : Container(),
      cepNotFound
          ? CepNotFound(
              lastSearchedCep: lastSearchedCep,
            )
          : Container(),
      adressList.isNotEmpty
          ? TableAdressListOption(adressListOptions: adressList)
          : Container(),
    ]);
  }
}
