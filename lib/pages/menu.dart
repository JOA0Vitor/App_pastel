import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/CadastroItem.dart';
import 'package:trilhaapp/pages/login_page.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Menu")),
        body: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 300, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quantidade", style: TextStyle(fontSize: 25)),
                    Divider(
                      height: 20,
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 70,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Center(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ) //     ))),
                ),
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Cadastro de itens",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context); //remover a aba
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CadastroItem(
                                texto: "Cadastro de itens",
                              )),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Pesquisa",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Editar",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Gerar Relatórios",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 300,
                ),
                Divider(),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:
                        // TextButton(
                        //   onPressed: () {
                        //      Navigator.pushReplacement(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => const MyMenu()));
                        //   },
                        // )
                        const Text(
                      "Sair",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
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