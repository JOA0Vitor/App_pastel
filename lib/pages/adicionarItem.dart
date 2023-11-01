// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:trilhaapp/pages/menu.dart';

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

class Item {
  int id;
  String nome;
  int quantidade;
  /*  bool disponivel; */

  Item({
    required this.id,
    required this.nome,
    required this.quantidade,
    /* required this.disponivel, */
  });
}

// ignore: camel_case_types
class _adicionarItemState extends State<adicionarItem> {
  final nomeController = TextEditingController();
  double quantidadeController = 1.0;
  double idController = 1.0;

  @override
  void initState() {
    super.initState();

    dropdownValue;
    idController;
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
                Row(
                  children: [
                    const Text("ID do Item:", style: TextStyle(fontSize: 21)),
                    Container(
                      width: 166,
                      margin: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: SpinBox(
                        min: 1,
                        max: 1000,
                        value: idController,

                        // ignore: avoid_print
                        onChanged: (value) {
                          setState(() {
                            idController = value;
                          });
                        },
                        decoration: const InputDecoration(
                          // border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
                // TextField(
                //   //ID

                //   // ignore: avoid_print
                //   onChanged: (value) => print(
                //       'O valor do ID é: $value (${value.characters.length})'),
                //   decoration: const InputDecoration(
                //       hintText: 'Digite o ID',
                //       hintStyle: TextStyle(fontSize: 18)),
                // ),
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
                const SizedBox(
                  height: 40,
                ),

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
                                title: const Text(
                                  "Item adicionado!!",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                content: Column(
                                  // direction: Axis.vertical,
                                  // mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Id: ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                            text:
                                                idController.toStringAsFixed(0),
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18)),
                                      ]),
                                    ),
                                    // Text(
                                    //   " ${idController.toStringAsFixed(0)}",
                                    // ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        const TextSpan(
                                          text: '   Nome do produto:\n\n',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                            text: nomeController.text,
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16)),
                                      ]),
                                    ),
                                    // Text(
                                    //     "Nome do produto:\n ${nomeController.text} "),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Tipo de Bandeja:\n\n',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                            text: dropdownValue,
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18)),
                                      ]),
                                    ),
                                    // Text("Tipo de Bandeja:\n $dropdownValue "),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Quantidade: ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                            text: quantidadeController
                                                .toStringAsFixed(0),
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                            )),
                                      ]),
                                    ),
                                    // Text(
                                    //     "Quantidade: ${quantidadeController.toStringAsFixed(0)}"),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const adicionarItem()));
                                      },
                                      child: const Text("Adicionar novo item")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyMenu()));
                                      },
                                      child: const Text("Voltar para Menu"))
                                ],
                              );
                            });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20)),
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
