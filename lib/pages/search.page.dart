import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/colors.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/viewModel/cep.view_model.dart';
import 'package:cep_register/widgets/history_table.widget.dart';
import 'package:cep_register/widgets/label_h1.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:cep_register/widgets/search_by_adress.widget.dart';
import 'package:cep_register/widgets/search_by_cep.widget.dart';
import 'package:cep_register/widgets/show_search_result.widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<CepModel> historyCep = [];
  List<CepModel> adressList = [];
  bool showCepSearchList = false;
  CepModel? lastSearchedCep;
  bool cepNotFound = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Center(child: LabelH1(label: searchCep)),
      SearchByCEP(getCep: getCepInfos),
      const Divider(
        thickness: 2,
        color: CustonColors.backgroundColor,
      ),
      const SizedBox(height: Breakpoints.b8),
      SearchByAdress(getCepByAdress: getCepByAdress),
      const SizedBox(height: Breakpoints.b8),
      const SizedBox(height: 30),
      isLoading == true
          ? const Padding(
              padding: EdgeInsets.all(Breakpoints.b24),
              child: CircularProgressIndicator())
          : Container(),
      ShowSearchResult(
          lastSearchedCep: lastSearchedCep,
          cepNotFound: cepNotFound,
          adressList: adressList),
      const SizedBox(height: 30),
      const Divider(
        thickness: 2,
        color: CustonColors.backgroundColor,
      ),
      const SizedBox(height: 30),
      ElevatedButton(
          child: const LabelH2(label: cepHistory),
          onPressed: () {
            FocusScope.of(context).unfocus();
            setState(() {
              showCepSearchList = !showCepSearchList;
            });
          }),
      Visibility(
          visible: showCepSearchList, child: HistoryTable(history: historyCep)),
      const SizedBox(height: 30),
    ]);
  }

  void getCepInfos(value) async {
    setState(() {
      isLoading = true;
      adressList = [];
    });
    var cepInfos = await CepViewModel().getCep(value);
    if (cepInfos?.CEP == null) {
      setState(() {
        cepNotFound = true;
      });
    } else {
      setState(() {
        cepNotFound = false;
        lastSearchedCep = cepInfos;
        historyCep.add(cepInfos!);
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  getCepByAdress(ufController, ruaController, cidadeController) async {
    setState(() {
      cepNotFound = false;
      isLoading = true;
    });

    if (ufController.text.trim().length == 2 &&
        ruaController.text.trim() != "" &&
        cidadeController.text.trim() != "") {
      var result = await CepViewModel().getCepByAdress(
          ufController.text, cidadeController.text, ruaController.text);
      if (result != []) {
        if (result.length == 1) {
          setState(() {
            lastSearchedCep = result[0];
            historyCep.add(result[0]);
          });
        } else {
          setState(() {
            adressList = result;
            lastSearchedCep = null;
          });
        }
      } else {
        setState(() {
          lastSearchedCep = null;
          cepNotFound = true;
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
