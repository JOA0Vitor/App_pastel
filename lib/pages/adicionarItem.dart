import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:firebase_core/firebase_core.dart';

class adicionarItem extends StatefulWidget {
  @override
  adicionarItemState createState() => adicionarItemState();
}

class adicionarItemState extends State<adicionarItem> {
  final TextEditingController _nomeProdutoController = TextEditingController();
  int _quantidade = 0;
  String _disponivel = "Bandeja Meia";

  void _adicionarItem() async {
    try {
      // Obtenha uma referência para a coleção no Firebase
      CollectionReference itemsCollection =
          FirebaseFirestore.instance.collection('Itens adicionados');

      // Adicione os dados do item à coleção
      await itemsCollection.add({
        'disponivel': _disponivel,
        'Nome produto': _nomeProdutoController.text,
        'quantidade': _quantidade,
      });

      // Mostrar uma mensagem de confirmação
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item adicionado com sucesso!"),
        ),
      );
    } catch (e) {
      // Trate erros, se necessário
      print('Erro ao adicionar item: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Adicionar Itens"),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text("Nome do produto:", style: TextStyle(fontSize: 21)),
                _buildTextField(
                  controller: _nomeProdutoController,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(children: [
                  const Text("Disponível:", style: TextStyle(fontSize: 21)),
                  _buildDropdownButton(
                    value: _disponivel,
                    onChanged: (value) {
                      setState(() {
                        _disponivel = value!;
                      });
                    },
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text("Quantidade:", style: TextStyle(fontSize: 21)),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildSpinBox(
                      labelText: "",
                      onChanged: (value) {
                        setState(() {
                          _quantidade = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20))),
                    onPressed: () {
                      _adicionarItem();
                    },
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.white, fontSize: 21),
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

  Widget _buildTextField({
    required TextEditingController controller,
  }) {
    return TextField(
        controller: controller,
        style: const TextStyle(
            color: Colors.black87,
            fontSize: 21,
            decorationColor: Color.fromRGBO(255, 255, 255, 0.702)),
        decoration: const InputDecoration(
          hintText: 'Digite nome do produto ',
          hintStyle: TextStyle(fontSize: 17),
          labelStyle: TextStyle(
            fontSize: 21,
            color: Colors.blue, // Cor do rótulo
          ),
        ));
  }

  Widget _buildSpinBox({
    required String labelText,
    required ValueChanged<double> onChanged,
  }) {
    return Row(
      children: [
        Container(
          width: 150,
          margin: const EdgeInsets.only(
            left: 25,
          ),
          child: SpinBox(
            min: 0,
            max: 1000,
            value: _quantidade.toDouble(),
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownButton({
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: 182,
      margin: const EdgeInsets.only(
        left: 10,
      ),
      child: DropdownButton<String>(
        iconSize: 30,
        isExpanded: true,
        style: const TextStyle(fontSize: 18, color: Colors.black87),
        value: value,
        items: const [
          DropdownMenuItem(
            value: "Bandeja Meia",
            child: Text("Bandeja Meia"),
          ),
          DropdownMenuItem(
            value: "Bandeja Completa",
            child: Text("Bandeja Completa"),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
