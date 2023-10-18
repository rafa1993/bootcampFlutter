class DadosCadastraisBack4appModel {
  List<Results>? results;

  DadosCadastraisBack4appModel({this.results});

  DadosCadastraisBack4appModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(DadosCadastraisBack4appModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  String? nome;
  Photo? photo;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId, this.nome, this.photo, this.createdAt, this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['nome'] = nome;
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Photo {
  String? sType;
  String? name;
  String? url;

  Photo({this.sType, this.name, this.url});

  Photo.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__type'] = sType;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
