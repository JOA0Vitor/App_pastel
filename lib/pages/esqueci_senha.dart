import 'package:flutter/material.dart';

// ignore: camel_case_types
class esqueci_senha extends StatefulWidget {
  const esqueci_senha({super.key});

  @override
  State<esqueci_senha> createState() => _esqueci_senhaState();
}

// ignore: camel_case_types
class _esqueci_senhaState extends State<esqueci_senha> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Esqueci minha senha"),
        backgroundColor: const Color.fromARGB(255, 2, 133, 255),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Insira o seu email cadastrado: ",
                style: TextStyle(fontSize: 21),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    decorationColor: Colors.white70),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 23),
                  hintText: "Digite seu email",
                ),
              ),
              Padding(
                //gerar uma mensagem que o email foi enviado
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      //Fazer a funçao caso o email não seja entrado no bd
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        "Desculpe, não encontramos uma conta associada ao endereço de e-mail fornecido. Por favor, verifique o endereço de e-mail e tente novamente.",
                        style: TextStyle(),
                      )));
                      return;
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      'Recuperar senha',
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
