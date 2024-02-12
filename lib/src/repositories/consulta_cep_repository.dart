// ignore_for_file: non_constant_identifier_names

import 'package:consulta_cep/src/models/consulta_cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConsultaCepRepository {
  // ignore: prefer_final_fields
  var _dio = Dio();

  ConsultaCepRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get("BACK4APPAPPLICATION");
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.get("BACK4APPRESTAPIKEY");
    _dio.options.headers["content-type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACK4APPBASEURL");
  }
  Future<ConsultaCepModel> getConsultaCep() async {
    var result = await _dio.get("/consulta_cep");
    return ConsultaCepModel.fromJson(result.data);
  }

  Future<void> salvar(ConsultaCep consultaCep) async {
    try {
      await _dio.post("/consulta_cep", data: consultaCep.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }
}
