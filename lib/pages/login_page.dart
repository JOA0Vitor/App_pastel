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
              const SizedBox(
                height: 70,
              ),
              // Image.asset('assets/images/logo.png'),
              Container(
                //img
                width: 150,
                height: 150,
                color: Colors.amber,
              ),
              Container(
                //login
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 130,
                  right: 30,
                  bottom: 15,
                ),
                color: Colors.white60,
                width: double.infinity,
                height: 50,
                alignment: Alignment.centerLeft,
                child: const Text(" Login:"),
              ),
              Container(
                //Senha
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                color: Colors.white70,
                height: 50,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: const Text(" Senha:"),
              )
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