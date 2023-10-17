import 'package:flutter/material.dart';
import 'package:trilhaapp/main.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Insira o seu email, e enviaremos um link para você voltar a acessar a sua conta ",
                style: TextStyle(fontSize: 21),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(hintText: "Digite seu email"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: SizedBox(
                  width: 260,
                  child: ElevatedButton(
                    onPressed: () {
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text(
                      //   "Email Invalidado",
                      //   style: TextStyle(),
                      // )));
                    },
                    style: const ButtonStyle(),
                    child: SizedBox(
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.all(8)),
                        ),
                        child: const Text(
                          "Recuperar senha ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
