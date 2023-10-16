import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cep_model.dart';

class ViaCepRepository {
  Future<List<ViaCEPModel>> consultarCEP(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return (json as List).map((e) => ViaCEPModel.fromJson(e)).toList();
    } else {
    return [];
  }
  }
}