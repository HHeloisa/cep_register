import 'dart:convert';

import 'package:cep_register/models/cep.model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CepService {
  String baseURLBack4App =
      "https://parseapi.back4app.com/classes/registeredCeps";
  getCep(String cep) async {
    Response response = await http.get(getCepUri(cep));
    return response;
  }

  Uri getCepUri(String cep) {
    return Uri.parse("https://viacep.com.br/ws/$cep/json/");
  }

  getCepByAdress(String uf, String city, String street) async {
    Response response = await http
        .get(Uri.parse("https://viacep.com.br/ws/$uf/$city/$street/json/"));
    return response;
  }

  registerCEP(CepModel cepModel) async {
    var body = {
      "CEP": cepModel.CEP,
      "logradouro": cepModel.logradouro,
      "uf": cepModel.uf,
      "bairro": cepModel.bairro,
      "cidade": cepModel.localidade,
      "teste": cepModel.referencia
    };

    Response response = await http.post(Uri.parse(baseURLBack4App),
        headers: getBack4AppHeaders(), body: json.encode(body));

    return response;
  }

  getAllRegisteredCeps() async {
    Response response = await http.get(Uri.parse(baseURLBack4App),
        headers: getBack4AppHeaders());
    return response;
  }

  removeCEPRegister(String cepId) async {
    await http.delete(Uri.parse("$baseURLBack4App/$cepId"),
        headers: getBack4AppHeaders());
  }

  updateCepRegister(CepModel updatedCepModel) async {
    await http.put(Uri.parse("$baseURLBack4App/${updatedCepModel.objectId}"),
        headers: getBack4AppHeaders(), body: json.encode(updatedCepModel));
  }

  getBack4AppHeaders() => {
        "X-Parse-Application-Id": "kMjZc9qs8SL45WSTD2HusncKHF3mhvTmCUkXOvcX",
        "X-Parse-REST-API-Key": "UVEwy8bfJwLjBz4nhv6ygwdDgyOZTmlDT4W50p74",
        "Content-Type": "application/json"
      };
}
