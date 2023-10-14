import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/Cadastro_login.dart';
import 'package:trilhaapp/pages/esqueci_senha.dart';
import 'package:trilhaapp/pages/menu.dart'; //padrao ios

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =
      TextEditingController(text: ""); //text: "email@email.com"
  TextEditingController senhaController =
      TextEditingController(text: ""); //text: "teste123"

  bool isObscureText = true;

  @override //tela
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 177, 177, 177),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight:
                  MediaQuery.of(context).size.height, //pegar o tamanho da tela
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: Container()), //aqui tem 1 flex
                    Expanded(
                      //ficou seis oito
                      flex: 6,
                      child: Image.network(
                        "https://i.pinimg.com/originals/28/12/d7/2812d78d2f192fc317da48602c93666c.png",
                      ),
                    ),
                    Expanded(child: Container()), //aqui tem 1 flex
                  ],
                ),
                const Text(
                  "Bem-vindo",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.black87,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 21,
                        decorationColor: Colors.white70),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 18),
                        hintText: "Email",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        hintStyle: TextStyle(color: Colors.black87),
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.black87,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    //Senha
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    // color: Color.fromARGB(179, 199, 192, 192),
                    height: 40,
                    alignment:
                        Alignment.center, //A linhar o texto dentro do bloco

                    child: TextField(
                      cursorColor: Colors.black87,
                      obscureText: isObscureText,
                      controller: senhaController,
                      onChanged: (value) {
                        //ele é uma variavel que cada vez que a gente click ele vai retorna uam função e parametro string
                        debugPrint(value);
                      },
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 21,
                          decorationColor: Colors.white70),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 6),
                        hintText: "Senha",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        hintStyle: const TextStyle(color: Colors.black87),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.black87,
                        ),
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
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  //Botão
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  // color: Colors.white70,
                  // height: 38,
                  alignment:
                      Alignment.center, //A linhar o texto dentro do bloco
                  width: 150,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          //No if se for igual vai entrar na tela de menu
                          if (emailController.text.trim() ==
                                  "pastel@gmail.com" &&
                              senhaController.text.trim() == "teste123") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyMenu()));
                          } else {
                            //No else vai gerar um erro na tela
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "Email ou senha incorreta",
                              style: TextStyle(),
                            )));
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(179, 0, 0, 0))),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                          ),
                        )),
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  child: Container(
                    //Botão
                    // margin: const EdgeInsets.symmetric(
                    //   horizontal: 100,
                    // ),

                    height: 30,

                    alignment:
                        Alignment.center, //A linhar o texto dentro do bloco
                    child: const Text("Esqueci minha senha",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(250, 148, 22, 13))),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const esqueci_senha()),
                      (Route<dynamic> route) => true,
                    );
                  },
                ),
                InkWell(
                  child: Container(
                      //Botão
                      //color: Colors.white70,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      height: 30,
                      alignment:
                          Alignment.center, //A linhar o texto dentro do bloco
                      child: const Text(
                        "Criar uma conta",
                        style: TextStyle(fontSize: 20),
                      )),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const cadastro_login()),
                      (Route<dynamic> route) => true,
                    );
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*arrendondar 
  style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            )
          )
  
  */
