import 'package:bootflutter/model/cep_model.dart';
import 'package:bootflutter/repository/cep_repository.dart';
import 'package:flutter/material.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  late ViaCepRepository viaCepRepository;
  var listCep = <ViaCEPModel>[];

  @override
  void initState() {
    super.initState();
    viaCepRepository = ViaCepRepository();
    carregarDados();
  }

  carregarDados() async {
    listCep = await viaCepRepository.consultarCEP();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Cep"),
      ),
      body: ListView.builder(
          itemCount: listCep.length,
          itemBuilder: (_, index) {
            var cep = listCep[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CepPage(postId: cep.id)));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cep.logradouro.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cep.localidade.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    ));
  }
}