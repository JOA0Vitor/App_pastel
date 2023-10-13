import 'package:flutter/material.dart';

class adicionarItem extends StatelessWidget {
  const adicionarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Adicionar itens"),
        ),
        body: const SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ID:",
                style: TextStyle(fontSize: 21),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Digite o ID',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Nome do produto:", style: TextStyle(fontSize: 21)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Digite nome do produto',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Sabores:", style: TextStyle(fontSize: 21)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Aqui vou colocar um option',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Quantidade:", style: TextStyle(fontSize: 21)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Aqui vai o numero e + 0 -',
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
