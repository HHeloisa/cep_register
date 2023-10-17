import 'dart:convert';

import 'package:cep_register/models/cep.model.dart';
import 'package:cep_register/services/cep.service.dart';

import 'package:http/http.dart';

class CepViewModel {
  List<CepModel> registeredCeps = [];
  Future<CepModel?> getCep(String cep) async {
    CepService cepService = CepService();
    Response response = await cepService.getCep(cep);
    if (response.statusCode != 200) {
      // TODO: handle error
      return null;
    } else {
      var json = jsonDecode(response.body);
      var cepModel = CepModel.fromJson(json);
      return cepModel;
    }
  }

  Future<List<CepModel>> getCepByAdress(
      String uf, String city, String street) async {
    CepService cepService = CepService();
    Response response = await cepService.getCepByAdress(uf, city, street);
    if (response.statusCode != 200) {
      // TODO: handle
      return [];
    } else {
      var json = jsonDecode(response.body);
      return json == []
          ? json
          : (json as List).map((e) => CepModel.fromJson(e)).toList();
    }
  }

  Future<bool> registerCEP(CepModel cepModel) async {
    CepService cepService = CepService();
    Response response = await cepService.registerCEP(cepModel);
    return response.statusCode != 201 ? false : true;
  }

  Future<List?> getAllRegisteredCeps() async {
    CepService cepService = CepService();
    Response response = await cepService.getAllRegisteredCeps();
    if (response.statusCode != 200) {
      // TODO: HandleError
      return null;
    } else {
      var list = json.decode(response.body)["results"];
      var list2 = list.map((e) => CepModel.fromJson(e)).toList();

      return list2;
    }
  }

  Future<void> deleteCep(CepModel cep) async {
    if (cep.objectId != null) CepService().removeCEPRegister(cep.objectId!);
  }

  Future<void> updateCepRegister(CepModel updatedCepModel) async {
    if (updatedCepModel.objectId != null) {
      await CepService().updateCepRegister(updatedCepModel);
    }
  }
}
