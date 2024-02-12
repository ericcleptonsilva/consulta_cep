import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/consulta_via_cep_model.dart';

class ViaCepRepository {
  Future<ViaCepModel> getConsultaViaCep(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCepModel.fromJson(json);
    } else {
      return ViaCepModel();
    }
  }
}
