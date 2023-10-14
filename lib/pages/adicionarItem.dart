import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

// ignore: camel_case_types
class adicionarItem extends StatelessWidget {
  const adicionarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar itens"),
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
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Digite o ID',
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("Nome do produto:", style: TextStyle(fontSize: 21)),
                const TextField(
                  decoration: InputDecoration(
                      hintText: 'Digite nome do produto',
                      hintStyle: TextStyle(fontSize: 16)),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("Sabores:", style: TextStyle(fontSize: 21)),
                const TextField(
                  decoration: InputDecoration(
                      hintText: 'Aqui vou colocar um option',
                      hintStyle: TextStyle(fontSize: 16)),
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
