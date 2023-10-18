import 'package:flutter/material.dart';

import '../model/dados_cadastrais_back4app_model.dart';
import '../repository/back4app/dados_cadastrais_back4app_repository.dart';

class DadosCadastraisHttpPage extends StatefulWidget {
  const DadosCadastraisHttpPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisHttpPage> createState() => _DadosCadastraisHttpPageState();
}

class _DadosCadastraisHttpPageState extends State<DadosCadastraisHttpPage> {
  DadosCadastraisBack4AppRepository dadosCadastraisBack4AppRepository = DadosCadastraisBack4AppRepository();
  var _dadosCadastraispBack4App = DadosCadastraisBack4appModel([]);
  var nomeContoller = TextEditingController();
  var fotoContoller = TextEditingController();
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterDadosCadastrais();
  }

  void obterDadosCadastrais() async {
    setState(() {
      carregando = true;
    });
    _dadosCadastraispBack4App = await dadosCadastraisBack4AppRepository.getDadosCadastrais();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dados Cadastrais HTTP"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.app_registration),
          onPressed: () {
            nomeContoller.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Nome: "),
                    content: TextField(
                      controller: nomeContoller,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await dadosCadastraisBack4AppRepository.criar(
                                DadosCadastraisBack4appModel.criar(
                                    nomeContoller.text, false));
                            Navigator.pop(context);
                            getDadosCadastrais();
                            setState(() {});
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              carregando
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _dadosCadastraispBack4App.results.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var tarefa = _dadosCadastraispBack4App.results[index];
                            return Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirection) async {
                                await dadosCadastraisBack4AppRepository.remover(dadosCadastrais.objectId);
                                obterDadosCadastrais();
                              },
                              key: Key(dadosCadastrais.nome),
                              child: ListTile(
                                title: Text(dadosCadastrais.nome),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ));
  }
}