class CepBack4appModel {
  List<CepBack4appModel> results = [ ];

  CepBack4appModel(this.results);

  CepBack4appModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CepBack4appModel>[];
      json['results'].forEach((v) {
        results.add(CepBack4appModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
      return data;
  }
}

class CepBack4AppModel {
  String objectId = "";
  String logradouro = "";
  String localidade = "";
  String createdAt = "";
  String updatedAt = "";

  CepBack4AppModel(
      this.objectId,
      this.logradouro,
      this.localidade,
      this.createdAt,
      this.updatedAt);

  CepBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    logradouro = json['logradouro'];
    localidade = json['localidade'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['logradouro'] = logradouro;
    data['localidade'] = localidade;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
