import 'package:flutter/material.dart'; //padrao ios

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override //tela
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF7D79D0),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset('assets/images/logo.png'),
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
              const Text(
                "Faça seu login",
                style: TextStyle(fontSize: 25),
              ),
              Container(
                //login
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 30,
                  right: 30,
                  bottom: 15,
                ),
                color: Colors.white60,
                width: double.infinity,
                height: 40,
                alignment: Alignment.centerLeft,
                child: const Row(
                  children: [
                    Text(" Login:"),
                  ],
                ),
              ),
              Container(
                //Senha
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                color: Colors.white70,
                height: 40,
                alignment:
                    Alignment.centerLeft, //A linhar o texto dentro do bloco
                width: double.infinity,
                child: const Row(
                  children: [
                    Text(" Senha:"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                //Botão
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                color: Colors.white70,
                height: 40,
                alignment: Alignment.center, //A linhar o texto dentro do bloco
                width: 150,
                child: const Text("Entrar"),
              ),
              Expanded(child: Container()),
              Container(
                //Botão
                //margin: const EdgeInsets.symmetric( horizontal: 0,),
                height: 30,
                alignment: Alignment.center, //A linhar o texto dentro do bloco
                child: const Text("Esqueci minha senha",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(250, 148, 22, 13))),
              ),
              Container(
                  //Botão
                  //color: Colors.white70,
                  margin: const EdgeInsets.only(top: 10, bottom: 30),
                  height: 30,
                  alignment:
                      Alignment.center, //A linhar o texto dentro do bloco
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
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