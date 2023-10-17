import 'package:bootflutter/repository/back4app/cep_back4app_repository.dart';
import 'package:flutter/material.dart';
import '../model/cep_back4app_model.dart';

class CepHttpPage extends StatefulWidget {
  const CepHttpPage({Key? key}) : super(key: key);

  @override
  State<CepHttpPage> createState() => _CepHttpPageState();
}

class _CepHttpPageState extends State<CepHttpPage> {
  CepBack4AppRepository cepRepository = CepBack4AppRepository();
  var _cepBack4App = CepBack4appModel([]);
  var logradouroContoller = TextEditingController();
  var localidade = TextEditingController();
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterCep();
  }

  void obterCep() async {
    setState(() {
      carregando = true;
    });
    _cepBack4App = await cepRepository.getCep();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cep HTTP"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            logradouroContoller.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar cep"),
                    content: TextField(
                      controller: logradouroContoller,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await cepRepository.criar(
                                CepBack4appModel.criar(
                                    logradouroContoller.text, false));
                            Navigator.pop(context);
                            getCEP();
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
                          itemCount: _cepBack4App.results.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var tarefa = _cepBack4App.results[index];
                            return Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirection) async {
                                await cepRepository.remover(cep.objectId);
                                obterCep();
                              },
                              key: Key(cep.logradouro),
                              child: ListTile(
                                title: Text(cep.logradouro),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ));
  }
}