import 'package:flutter/material.dart';

class CadastroItem extends StatelessWidget {
  final String texto;
  const CadastroItem({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(texto)), //Header and
        body: const Center(child: Text("Aqui vou fazer o cadastro do itens")),
      ),
    );
  }
}
