// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

const List<String> disponivelParaSelecionar = <String>[
  'Bandega Meia',
  'Bandega Completa'
];

String? dropdownValue;

// ignore: camel_case_types
class adicionarItem extends StatefulWidget {
  const adicionarItem({super.key});
  @override
  State<adicionarItem> createState() => _adicionarItemState();
}

class DadosAdicionado {
  int id;
  String nome;
  int quantidade;

  DadosAdicionado(this.id, this.nome, this.quantidade);
}

// ignore: camel_case_types
class _adicionarItemState extends State<adicionarItem> {
  final idController = TextEditingController();
  final nomeController = TextEditingController();
  @override
  void initState() {
    super.initState();

    idController.addListener(_printLatestValue);
    nomeController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    idController.dispose();
    nomeController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = idController.text;
    print('Second text field: $text (${text.characters.length})');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar itens"),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "ID:",
                  style: TextStyle(fontSize: 21),
                ),
                TextField(
                  //ID
                  controller: idController,
                  onChanged: (value) => print(
                      'First text field: $value (${value.characters.length})'),
                  decoration: const InputDecoration(
                      hintText: 'Digite o ID',
                      hintStyle: TextStyle(fontSize: 16)),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("Nome do produto:", style: TextStyle(fontSize: 21)),
                TextField(
                  //produto
                  controller: nomeController,
                  onChanged: (value) => print(
                      'First text field: $value (${value.characters.length})'),
                  decoration: const InputDecoration(
                    hintText: 'Digite nome do produto ',
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                Row(
                  children: [
                    const Text("Disponível:", style: TextStyle(fontSize: 21)),
                    Container(
                      width: 182,
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          iconSize: 20,
                          isExpanded: true,
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black87),
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            // Atualize o valor quando uma opção for selecionada.
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: disponivelParaSelecionar.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ),
                // ignore: avoid_unnecessary_containers
                Row(
                  children: [
                    const Text("Quantidade:", style: TextStyle(fontSize: 21)),
                    Container(
                      width: 150,
                      margin: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: SpinBox(
                        min: 1,
                        max: 1000,
                        value: 1,

                        // ignore: avoid_print
                        onChanged: (value) => print(value),
                        decoration: const InputDecoration(
                          // border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(16)),
                      ),
                      child: const Text(
                        "Adicionar",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
