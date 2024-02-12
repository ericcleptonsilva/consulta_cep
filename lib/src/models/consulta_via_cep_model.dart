// ignore_for_file: unnecessary_getters_setters

class ViaCepModel {
  String? _cep;
  String? _logradouro;
  String? _bairro;
  String? _localidade;
  String? _uf;

  ViaCepModel(
      {String? cep,
      String? logradouro,
      String? bairro,
      String? localidade,
      String? uf}) {
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
    if (uf != null) {
      _uf = uf;
    }
  }
  ViaCepModel.criar(String? cep, String? logradouro, String? bairro,
      String? localidade, String? uf);

  String? get cep => _cep;
  set cep(String? cep) => _cep = cep;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro;
  String? get localidade => _localidade;
  set localidade(String? localidade) => _localidade = localidade;
  String? get uf => _uf;
  set uf(String? uf) => _uf = uf;

  ViaCepModel.fromJson(Map<String, dynamic> json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['bairro'] = _bairro;
    data['localidade'] = _localidade;
    data['uf'] = _uf;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['bairro'] = _bairro;
    data['localidade'] = _localidade;
    data['uf'] = _uf;
    return data;
  }
}
