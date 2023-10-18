import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../model/dados_cadastrais_back4app_model.dart';
import 'back4app_custom_dio.dart';

class DadosCadastraisBack4AppRepository {
  final _customDio = Back4appCustomDio();

  DadosCadastraisBack4AppRepository();

  Future< DadosCadastraisBack4appModel> getDadosCadastrais() async {
    var url = "/DadosCadastraisList";
    var result = await _customDio.dio.get(url);
    return DadosCadastraisBack4appModel.fromJson(result.data);
  }

  Future<void> criar(DadosCadastraisBack4appModel dadosCadastraisBack4appModel) async {
    try {
      await _customDio.dio
          .post("/DadosCadastraisList", data: dadosCadastraisBack4appModel.toJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(DadosCadastraisBack4appModel dadosCadastraisBack4appModel) async {
    try {
      var response = await _customDio.dio.put(
          "/DadosCadastraisList/${dadosCadastraisBack4appModel.objectId}",
          data: dadosCadastraisBack4appModel.toJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      var response = await _customDio.dio.delete(
        "/DadosCadastraisList/$objectId",
      );
    } catch (e) {
      throw e;
    }
  }
}