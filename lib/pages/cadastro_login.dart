import 'package:flutter/material.dart';

// ignore: camel_case_types
class cadastro_login extends StatefulWidget {
  const cadastro_login({super.key});

  @override
  State<cadastro_login> createState() => _cadastro_loginState();
}

// ignore: camel_case_types
class _cadastro_loginState extends State<cadastro_login> {
  var nomeController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController senhaController = TextEditingController(text: "");
  TextEditingController conSenhaController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro"),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ), //Header and
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                    "Preencha o espaço abaixo para começar a usar o app"),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Nome:",
                  style: TextStyle(fontSize: 21),
                ),
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu nome',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "E-mail:",
                  style: TextStyle(fontSize: 21),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Senha:",
                  style: TextStyle(fontSize: 21),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua senha',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Confirme a Senha:",
                  style: TextStyle(fontSize: 21),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua senha',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // TextButton(
                //     onPressed: () {
                //       debugPrint(nomeController.text);
                //       debugPrint(emailController.text);
                //     },
                //     child: const Text("Salvar")),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          // ignore: unused_label

                          // ignore: unused_label

                          //No if se for igual vai entrar na tela de menu
                          // if (emailController.text.trim() == "pastel@gmail.com" &&
                          //     senhaController.text.trim() == "teste123") {
                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const MyMenu()));
                          // } else {
                          //   //No else vai gerar um erro na tela
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //           content: Text(
                          //     "Email ou senha incorreta",
                          //     style: TextStyle(),
                          //   )));
                          // }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(179, 0, 0, 0))),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                          ),
                        )),
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
