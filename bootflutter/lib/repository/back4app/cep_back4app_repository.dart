import 'package:bootflutter/model/cep_back4app_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'back4app_custom_dio.dart';

class CepBack4AppRepository {
  final _customDio = Back4appCustomDio();

  CepBack4AppRepository();

  Future<CepBack4appModel> getCep() async {
    var url = "/CepList";
    var result = await _customDio.dio.get(url);
    return CepBack4appModel.fromJson(result.data);
  }

  Future<void> criar(CepBack4AppModel cepBack4AppModel) async {
    try {
      await _customDio.dio
          .post("/CepList", data: cepBack4AppModel.toJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(CepBack4AppModel cepBack4AppModel) async {
    try {
      var response = await _customDio.dio.put(
          "/CepList/${cepBack4AppModel.objectId}",
          data: cepBack4AppModel.toJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      var response = await _customDio.dio.delete(
        "/CepList/$objectId",
      );
    } catch (e) {
      throw e;
    }
  }
}