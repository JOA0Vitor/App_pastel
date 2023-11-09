import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/adicionarItem.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/pesquisar.dart';
// Adicionar no menu https://api.flutter.dev/flutter/widgets/ListView-class.html

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
        appBar: AppBar(
          title: const Text("Menu"),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Seus dados",
                        style: TextStyle(fontSize: 25),
                        // textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    // color: Color.fromARGB(255, 180, 118, 118),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 254, 254, 254),
                      border: Border.all(
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text(
                                'Total de Itens',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  '14',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 21,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            //barra horizontal
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 254, 254, 254),
                              border: Border.all(
                                width: .8,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 50),
                            ),
                          ),
                          const Column(
                            children: [
                              Text(
                                'Quantidades vendidas',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 13,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  '54', //valores do bando de dados
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 21,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Adicionados recentemente',
                            // textAlign: TextAlign.right, //olha depois
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ListTile(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(5),
                            //     side: const BorderSide(color: Colors.black12)),
                            title: SizedBox(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ////////////////////////////////
                                    Container(
                                      //Primeiro card
                                      width: 180,
                                      height: 70, //olhar a fonte depois
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      decoration: const ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(width: .7)),
                                      ),
                                      child: const Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 4, left: 4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 71,
                                                  child: Text(
                                                    '1 out 2023', //Ainda nao sei se vou colocar a data
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                  child: Text(
                                                    '32 Uni', //Variavel
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, bottom: 6),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Pastel de queijo',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      //Primeiro card
                                      width: 180,
                                      height: 70, //olhar a fonte depois
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      decoration: const ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(width: .7)),
                                      ),
                                      child: const Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 4, left: 4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 71,
                                                  child: Text(
                                                    '2 out 2023', //Ainda nao sei se vou colocar a data
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                  child: Text(
                                                    '32 Uni', //Variavel
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, bottom: 6),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Pastel de frango',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      //Primeiro card
                                      width: 180,
                                      height: 70, //olhar a fonte depois
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      decoration: const ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(width: .7)),
                                      ),
                                      child: const Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 4, left: 4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 71,
                                                  child: Text(
                                                    '3 out 2023', //Ainda nao sei se vou colocar a data
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                  child: Text(
                                                    '32 Uni', //Variavel
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, bottom: 6),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Pastel de bacalhau',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      //Primeiro card
                                      width: 180,
                                      height: 70, //olhar a fonte depois
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      decoration: const ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(width: .7)),
                                      ),
                                      child: const Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 4, left: 4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 71,
                                                  child: Text(
                                                    '4 out 2023', //Ainda nao sei se vou colocar a data
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                  child: Text(
                                                    '32 Uni', //Variavel
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, bottom: 6),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Pastel de charque',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Histórico de saida',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Divider(
                    //linha pos nome
                    height: 20,
                    color: Colors.grey,
                    thickness: 1,
                    endIndent: 70,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 65,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1)),
                          ),
                          child: const Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Pastel de queijo',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      '25 Uni Disponível',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Terça,  1 de outubro',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 65,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1)),
                          ),
                          child: const Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Pastel de queijo',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      '25 Uni Disponível',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Terça,  2 de outubro',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 65,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1)),
                          ),
                          child: const Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Pastel de queijo',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      '25 Uni Disponível',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Terça,  3 de outubro',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                          builder: (context) => const adicionarItem()),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Pesquisar",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context); //remover a aba
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pesquisar()),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Editar",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Gerar Relatórios",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 300,
                ),
                const Divider(),
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
                    showDialog(
                        context: context,
                        builder: (BuildContext bc) {
                          return AlertDialog(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: const Text(
                              'Sair',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: const Wrap(
                              children: [
                                Text('Você sairá do aplicativo!'),
                                SizedBox(
                                  height: 30,
                                ),
                                Text('Deseja realmente sair do aplicativo ?'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Não')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  },
                                  child: const Text('Sim'))
                            ],
                          );
                        });
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
