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
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Preencha o espaço abaixo",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Nome:",
                  style: TextStyle(fontSize: 21),
                ),
                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu nome',
                    contentPadding: EdgeInsets.only(top: 23),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "E-mail:",
                  style: TextStyle(fontSize: 21),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu email',
                    contentPadding: EdgeInsets.only(top: 23),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Senha:",
                  style: TextStyle(fontSize: 21),
                ),
                TextFormField(
                  controller: senhaController,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua senha',
                    contentPadding: EdgeInsets.only(top: 23),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Confirme a Senha:",
                  style: TextStyle(fontSize: 21),
                ),
                TextFormField(
                  controller: conSenhaController,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua senha',
                    contentPadding: EdgeInsets.only(top: 23),
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
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(179, 0, 0, 0))),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 21,
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
