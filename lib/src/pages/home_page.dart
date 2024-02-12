// ignore_for_file: avoid_print

import 'package:consulta_cep/src/models/consulta_via_cep_model.dart';
import "package:consulta_cep/src/repositories/consulta_cep_repository.dart";
import 'package:consulta_cep/src/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';
import '../models/consulta_cep_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field, prefer_final_fields, non_constant_identifier_names
  var consultCepRepository = ConsultaCepRepository();
  var consultCepModel = ConsultaCepModel([]);
  var viaCepRepository = ViaCepRepository();
  // ignore: unused_field, prefer_final_fields, non_constant_identifier_names

  var textCep = TextEditingController(text: "");
  var viaCepModel = ViaCepModel();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    obterCep();
  }

  void consultaViaCep() async {
    var viaCep = textCep.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (viaCep.length == 8) {
      setState(() {
        loading = true;
      });
      viaCepModel = await viaCepRepository.getConsultaViaCep(viaCep);
      consultCepRepository.salvar(ConsultaCep.create(
          viaCepModel.cep.toString(),
          viaCepModel.logradouro.toString(),
          viaCepModel.bairro.toString(),
          viaCepModel.localidade.toString(),
          viaCepModel.uf.toString()));
    }
    setState(() {
      loading = false;
    });
  }

  void obterCep() async {
    consultCepModel = await consultCepRepository.getConsultaCep();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loading
                      ? const CircularProgressIndicator()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text("CEP: ${viaCepModel.cep ?? ""}"),
                              Text(
                                  "LOGRADOURO: ${viaCepModel.logradouro ?? ""}"),
                              Text("BAIRRO: ${viaCepModel.bairro ?? ""}"),
                              Text("CIDADE: ${viaCepModel.localidade ?? ""}"),
                            ])
                ],
              ),
            ),
            loading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: consultCepModel.cepsList.length,
                        itemBuilder: (BuildContext bc, int index) {
                          var cep = consultCepModel.cepsList[index];
                          return ListTile(
                            title: Text("CPE: ${cep.cep}"),
                            subtitle: Text(
                                "Endereço: ${cep.logradouro}, Bairro: ${cep.bairro} - ${cep.localidade}"),
                          );
                        }),
                  ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          return await showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  content: TextField(
                    controller: textCep,
                  ),
                  title: const Text("Adicionar CEP"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            consultaViaCep();
                          });
                        },
                        child: const Text("Salvar")),
                  ],
                );
              });
        },
      ),
    );
  }
}
