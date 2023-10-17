import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/viewModel/cep.view_model.dart';
import 'package:cep_register/widgets/cep_section_item.widget.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class RegisteredCeps extends StatefulWidget {
  const RegisteredCeps({super.key});

  @override
  State<RegisteredCeps> createState() => _RegisteredCepsState();
}

class _RegisteredCepsState extends State<RegisteredCeps> {
  late List cepRegisteredList;
  CepViewModel cepViewModel = CepViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cepViewModel.getAllRegisteredCeps(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return snapshot.data != null
                  ? snapshot.data!.isNotEmpty
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            cepRegisteredList = snapshot.data!;
                            var currentCep = cepRegisteredList[index];
                            return SectionIten(
                                cepModel: currentCep,
                                deleteFunction: removeAndUpdate);
                          },
                        )
                      : const Center(
                          child: LabelH2(
                          label: noCepRegistred,
                          textAlign: TextAlign.center,
                        ))
                  : const LabelH2(label: somethingWrong);
            case ConnectionState.none:
              return Container();
            case ConnectionState.active:
              return Container();
          }
        });
  }

  removeAndUpdate(CepModel cepModel) async {
    await CepViewModel().deleteCep(cepModel);

    setState(() {
      cepRegisteredList
          .removeWhere((element) => element.objectId == cepModel.objectId);
    });
  }
}
