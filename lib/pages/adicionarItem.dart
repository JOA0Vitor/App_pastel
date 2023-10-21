// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

const List<String> disponivelParaSelecionar = <String>[
  'Bandeja Meia',
  'Bandeja Completa'
];

String? dropdownValue;

// ignore: camel_case_types
class adicionarItem extends StatefulWidget {
  const adicionarItem({super.key});

  @override
  State<adicionarItem> createState() => _adicionarItemState();
}

// ignore: camel_case_types
class _adicionarItemState extends State<adicionarItem> {
  final idController = TextEditingController();
  final nomeController = TextEditingController();
  double quantidadeController = 1.0;

  @override
  void initState() {
    super.initState();

    dropdownValue;
    idController.text;
    nomeController.text;
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

                  // ignore: avoid_print
                  onChanged: (value) => print(
                      'O valor do ID é: $value (${value.characters.length})'),
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
                  // ignore: avoid_print
                  onChanged: (value) => print(
                      'O nome do produto é: $value (${value.characters.length})'),
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
                          hint: const Center(child: Text('Selecione Um')),
                          iconSize: 20,
                          isExpanded: true,
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black87),
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: disponivelParaSelecionar.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              onTap: () {},
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
                        value: quantidadeController,

                        // ignore: avoid_print
                        onChanged: (value) {
                          setState(() {
                            quantidadeController = value;
                          });
                        },
                        decoration: const InputDecoration(
                          // border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ), //ShowModalBottonSheet

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: const Center(
                                  child: Text(
                                    "Item adicionado!!",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                content: Wrap(
                                  direction: Axis.vertical,
                                  // mainAxisSize: MainAxisSize.max,
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Id: ${idController.text}"),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                        "Nome do produto:\n ${nomeController.text} "),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text("Tipo de Bandeja:\n $dropdownValue "),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                        "Quantidade: ${quantidadeController.toStringAsFixed(0)}"),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        // ignore: unused_label
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 2, 133, 255)),
                                      ))
                                ],
                              );
                            });
                      },
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
