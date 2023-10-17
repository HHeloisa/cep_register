import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/constants/string.dart';
import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/viewModel/cep.view_model.dart';
import 'package:cep_register/widgets/custon_scaffold.dart';
import 'package:cep_register/widgets/label_h2.dart';
import 'package:flutter/material.dart';

class EditCepPage extends StatefulWidget {
  const EditCepPage({required this.cepModel, super.key});

  final CepModel cepModel;
  @override
  State<EditCepPage> createState() => _EditCepPageState();
}

class _EditCepPageState extends State<EditCepPage> {
  TextEditingController refController = TextEditingController(text: "");
  TextEditingController ruaController = TextEditingController(text: "");
  TextEditingController complementoController = TextEditingController(text: "");
  TextEditingController bairroController = TextEditingController(text: "");
  TextEditingController cidadeController = TextEditingController(text: "");
  TextEditingController ufController = TextEditingController(text: "");
  TextEditingController cepController = TextEditingController(text: "");

  setValues(CepModel cepModel) {
    refController.text = cepModel.referencia ?? "";
    ruaController.text = cepModel.logradouro ?? "";
    complementoController.text = cepModel.complemento ?? "";
    bairroController.text = cepModel.bairro ?? "";
    cidadeController.text = cepModel.localidade ?? "";
    ufController.text = cepModel.uf ?? "";
    cepController.text = cepModel.CEP ?? "";
  }

  @override
  void dispose() {
    refController.dispose();
    ruaController.dispose();
    complementoController.dispose();
    bairroController.dispose();
    cidadeController.dispose();
    ufController.dispose();
    cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setValues(widget.cepModel);
    refController.text = widget.cepModel.referencia!;
    return CustonScaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelH2(label: editReference),
          const SizedBox(height: Breakpoints.b8),
          TextFormField(
            controller: refController,
          ),
          const SizedBox(height: Breakpoints.b32),
          const Divider(
            thickness: 3,
            color: Colors.yellow,
          ),
          const SizedBox(height: Breakpoints.b32),
          const LabelH2(label: checkAndUpdateCep),
          const SizedBox(height: Breakpoints.b8),
          Row(
            children: [
              const LabelH2(label: streetString),
              const SizedBox(width: Breakpoints.b8),
              Expanded(
                child: TextFormField(
                  controller: ruaController,
                  readOnly: widget.cepModel.logradouro != null &&
                      canEdit(widget.cepModel.logradouro),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const LabelH2(label: complementString),
              const SizedBox(width: Breakpoints.b8),
              Expanded(
                child: TextFormField(
                  controller: complementoController,
                  readOnly: widget.cepModel.complemento != null &&
                      canEdit(widget.cepModel.complemento),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const LabelH2(label: neighborhoodString),
              const SizedBox(width: Breakpoints.b8),
              Expanded(
                child: TextFormField(
                  controller: bairroController,
                  readOnly: canEdit(widget.cepModel.bairro),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const LabelH2(label: cityString),
              const SizedBox(width: Breakpoints.b8),
              Expanded(
                child: TextFormField(
                  controller: cidadeController,
                  readOnly: canEdit(widget.cepModel.localidade),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const LabelH2(label: ufString),
              const SizedBox(width: Breakpoints.b8),
              Expanded(
                child: TextFormField(
                    controller: ufController,
                    readOnly: canEdit(widget.cepModel.uf)),
              ),
            ],
          ),
          Row(
            children: [
              const LabelH2(label: cepString),
              const SizedBox(width: Breakpoints.b8),
              Expanded(
                child: TextFormField(
                  controller: cepController,
                  readOnly: canEdit(widget.cepModel.CEP),
                ),
              ),
            ],
          ),
          const SizedBox(height: Breakpoints.b32),
          Center(
            child: ElevatedButton(
              child: const LabelH2(label: updateAdress),
              onPressed: () async {
                await updateCep();
              },
            ),
          )
        ],
      )),
    );
  }

  bool canEdit(field) => field != null && field != "";

  updateCep() async {
    FocusScope.of(context).unfocus();
    CepModel updatedCepModel = CepModel(
        CEP: cepController.text,
        localidade: cidadeController.text,
        logradouro: ruaController.text,
        complemento: complementoController.text,
        bairro: bairroController.text,
        uf: ufController.text,
        referencia: refController.text,
        objectId: widget.cepModel.objectId);
    await CepViewModel().updateCepRegister(updatedCepModel);
    // ignore: use_build_context_synchronously
    Future.delayed(const Duration(seconds: 1));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(updatedAdress),
        duration: Duration(seconds: 1),
      ),
    );
    return Navigator.pushNamed(context, "/home");
  }
}
