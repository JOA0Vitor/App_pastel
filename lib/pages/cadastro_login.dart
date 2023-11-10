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
  bool isObscureText = true;
  bool isObscureTextsenha = true;

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
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      decorationColor: Colors.white70),
                  decoration: const InputDecoration(
                    hintText: 'Digite seu nome',
                    contentPadding: EdgeInsets.only(top: 22, left: 5),
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
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      decorationColor: Colors.white70),
                  decoration: const InputDecoration(
                    hintText: 'Digite seu email',
                    contentPadding: EdgeInsets.only(top: 22, left: 5),
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
                  obscureText: isObscureText,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      decorationColor: Colors.white70),
                  decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      contentPadding: const EdgeInsets.only(top: 22, left: 5),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black87,
                        ),
                      )),
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
                  obscureText: isObscureTextsenha,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      decorationColor: Colors.white70),
                  decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      contentPadding: const EdgeInsets.only(top: 22, left: 5),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureTextsenha = !isObscureTextsenha;
                          });
                        },
                        child: Icon(
                          isObscureTextsenha
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black87,
                        ),
                      )),
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
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        //Fazer a funçao caso o email não seja entrado no bd
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          "Conta criada com sucesso! Faça login agora",
                          style: TextStyle(),
                        )));
                        return;
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'Criar uma conta',
                        style: TextStyle(fontSize: 21, color: Colors.white),
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
