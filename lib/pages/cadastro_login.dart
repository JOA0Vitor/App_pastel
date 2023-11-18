// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/services/firebase_auth.dart';
import 'package:trilhaapp/services/firebase_auth.dart';
import 'package:trilhaapp/services/sign_up_page.dart';

// ignore: camel_case_types
class cadastro_login extends StatefulWidget {
  const cadastro_login({super.key});

  @override
  State<cadastro_login> createState() => _cadastro_loginState();
}

// ignore: camel_case_types
class _cadastro_loginState extends State<cadastro_login> {
  // final FirebaseAuth _auth = FirebaseAuth();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final con_passwordController = TextEditingController();
  bool isObscureText = true;
  bool isObscureTextsenha = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formaKey = GlobalKey<FormState>();
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    // bool _isloading = false;

    void _signUp() {
      if (_formaKey.currentState != null &&
          _formaKey.currentState!.validate()) {
        SignUpService().signUp(_emailController.text, _passwordController.text);
      } else {
        print('invalido');
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers, unused_element
    void _enviar() async {
      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      //   setState(() {
      //     _isloading = false;
      //     _usernameController.clear();
      //     _emailController.clear();
      //     _passwordController.clear();
      //   });
      // } catch (e) {
      //   print('Error creating user: ${e.toString()}');
      //   setState(() => _isloading = false);
      // }
    }

    // final user = await FlutterFireAuth(context)
    //     .createUserWithEmailAndPassword(username, email, password);

    // setState(() => _isloading = false);

    // if (user != null) {
    //   // ignore: use_build_context_synchronously
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => const LoginPage()));
    // }

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
                Form(
                    key: _formaKey,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Nome:",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        TextFormField(
                          controller: _usernameController,
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
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "E-mail:",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
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
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Senha:",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: isObscureText,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 19,
                              decorationColor: Colors.white70),
                          decoration: InputDecoration(
                              hintText: 'Digite sua senha',
                              contentPadding:
                                  const EdgeInsets.only(top: 22, left: 5),
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
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Confirme a Senha:",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        TextFormField(
                          controller: con_passwordController,
                          obscureText: isObscureTextsenha,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 19,
                              decorationColor: Colors.white70),
                          decoration: InputDecoration(
                              hintText: 'Digite sua senha',
                              contentPadding:
                                  const EdgeInsets.only(top: 22, left: 5),
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
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        _signUp();
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
