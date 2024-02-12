class ConsultaCepModel {
  List<ConsultaCep> cepsList = [];

  ConsultaCepModel(this.cepsList);

  ConsultaCepModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      cepsList = <ConsultaCep>[];
      json['results'].forEach((v) {
        cepsList.add(ConsultaCep.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = cepsList.map((v) => v.toJson()).toList();
    return data;
  }
}

class ConsultaCep {
  String objectId = "";
  String cep = "";
  String logradouro = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String createdAt = "";
  String updatedAt = "";

  ConsultaCep(this.objectId, this.cep, this.logradouro, this.bairro,
      this.localidade, this.uf, this.createdAt, this.updatedAt);
  ConsultaCep.create(
    this.cep,
    this.logradouro,
    this.bairro,
    this.localidade,
    this.uf,
  );

  ConsultaCep.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    return data;
  }
}
