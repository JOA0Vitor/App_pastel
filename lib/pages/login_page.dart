import 'package:flutter/material.dart';
import 'package:trilhaapp/login/login_service.dart';
import 'package:trilhaapp/pages/Cadastro_login.dart';
import 'package:trilhaapp/pages/esqueci_senha.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';

import 'package:trilhaapp/pages/menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //email: pastel@gmail.com
  //senha: teste123

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscureText = true;
  final _formaKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override //tela
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _login() async {
      if (_formaKey.currentState!.validate()) {
        try {
          // Se o formulário for válido, faça o login
          var loginResult = await LoginService()
              .login(_emailController.text, _passwordController.text);

          if (loginResult) {
            // Se o login for bem-sucedido, navegue para a tela MyMenu
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyMenu()),
              (Route<dynamic> route) => false,
            );
          } else {
            // Caso contrário, exiba uma mensagem de erro ou lide com o login mal-sucedido
            // Pode ser útil imprimir o valor de loginResult para depuração
            print('Erro no login: $loginResult');
          }
        } catch (e) {
          // Lidar com exceções, imprima para depuração
          print('Erro durante o login: $e');
        }
      } else {
        // Caso o formulário não seja válido, você pode lidar com isso aqui se necessário
      }
    }

    void _resetarForm() {
      _emailController.clear();
      _passwordController.clear();
    }

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('O usuário está desconectado no momento!!');
      } else {
        print('O usuário está conectado!!');
      }
    });

    FocusNode().requestFocus();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(child: Container()), //aqui tem 1 flex
                    Expanded(
                      //ficou seis/oito
                      flex: 8,
                      child: Image.asset("lib/images/logo.png"),
                    ),
                    Expanded(child: Container()), //aqui tem 1 flex
                  ],
                ),
                // const Text(
                //   "Bem-vindo",
                //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                // ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formaKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          //Validação do email
                          if (value!.length < 14) {
                            return "Esse email está curto demais ";
                          } else if (!value.contains("@")) {
                            return "Esse email está sem @ ";
                          }
                          return null;
                        },
                        controller: _emailController,
                        cursorColor: Colors.black87,
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        textInputAction: TextInputAction.next,
                        //Se eu tirar o focus ele começa a bugar
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            decorationColor:
                                Color.fromRGBO(255, 255, 255, 0.702)),
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 8) {
                            return "A senha deve ter pelo menos 8 caracteres";
                          }
                          return null;
                        },
                        cursorColor: Colors.black87,
                        obscureText: _isObscureText,
                        controller: _passwordController,
                        onChanged: (value) {
                          //ele é uma variavel que cada vez que a gente click ele vai retorna uam função e parametro string
                          debugPrint(value);
                        },
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 21,
                            decorationColor: Colors.white70),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 15),
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
                                _isObscureText = !_isObscureText;
                              });
                            },
                            child: Icon(
                              _isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _login();
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                // InkWell(
                //   child: Container(
                //     height: 30,
                //     alignment:
                //         Alignment.center, //A linhar o texto dentro do bloco
                //     child: const Text("Esqueci minha senha",
                //         style: TextStyle(
                //             fontSize: 20,
                //             color: Color.fromARGB(250, 148, 22, 13))),
                //   ),
                //   onTap: () {
                //     Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const esqueci_senha()),
                //       (Route<dynamic> route) => true,
                //     );
                //   },
                // ),
                InkWell(
                  child: Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
