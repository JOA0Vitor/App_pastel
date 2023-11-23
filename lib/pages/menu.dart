import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/adicionarItem.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/pesquisar.dart';
import 'package:trilhaapp/pages/testPesquisa.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, QuerySnapshot;

// Adicionar no menu https://api.flutter.dev/flutter/widgets/ListView-class.html
class Item {
  final String nome;
  final int quantidade;

  Item({required this.nome, required this.quantidade});
}

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  List<Map<String, dynamic>> _itens = [];
  // late List<Map<String, dynamic>> _itens;
  @override
  void initState() {
    super.initState();
    _carregarItens();
  }

  Future<void> _carregarItens() async {
    try {
      List<Map<String, dynamic>> itens = await FirestoreService().getItens();
      setState(() {
        _itens = itens;
      });
    } catch (e) {
      print('Erro ao carregar itens: $e');
    }
  }

  int totalDeItens = 0;

  late Future<List<Item>> itens;
  // ignore: unused_element
  void _adicionarItemNaLista(Item item) {
    // Adicione o item à lista de itens (estado do widget)
    setState(() {
      // Adicione o item à sua lista de itens existente ou faça o que for necessário
      // Exemplo: minhaLista.adrd(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Itens adicionados')
            //Adiciono collection.doc('nomeGrupo').update para editar
            .snapshots(),
        //adiconar o SetOptions(merge:true); para editar
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          totalDeItens = snapshot.data!.docs.length;

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                    "Olá , teste"), //aqui vai ficar o nome do usuario
                backgroundColor: const Color.fromARGB(255, 2, 133, 255),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
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
                                Column(
                                  children: [
                                    const Text(
                                      'Total de Itens cadastrado',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        totalDeItens
                                            .toString(), //adicionar um if para quando estiver menos de 10 itens ele ficar vermelhor
                                        style: TextStyle(
                                          color: totalDeItens <= 10
                                              ? Colors.red
                                              : Colors.black,
                                          fontSize: 25,
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
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: _itens != null && _itens.isNotEmpty
                                    ? ListTile(
                                        title: SizedBox(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                for (var item in _itens)
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                    ),
                                                    child: Container(
                                                      height: 85,
                                                      width: 180,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    width: .7)),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 4),
                                                        child: Column(
                                                          children: [
                                                            Text(item['Nome produto'] !=
                                                                    null
                                                                ? item[
                                                                    //Deixar assim
                                                                    'Nome produto']
                                                                : 'Nome não disponível'),
                                                            Text(
                                                                'Quantidade: ${item['quantidade']}'),
                                                            Text('Bandeja: ')
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        'Nenhum produto adicionado recentemente.'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 23),
                          // color: Colors.black12,
                          child: const Text(
                            'Histórico de saida',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                            height: 250, //255
                            child: ListView(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: double.infinity,
                                    height: 65,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                                'Pastel de carne',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                ),
                                              ),
                                              // Text(
                                              //   '25 Uni retirada',
                                              //   style: TextStyle(
                                              //     color: Colors.black,
                                              //     fontSize: 11,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 21, bottom: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '21 Unidades retirada',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 164, 25, 15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: double.infinity,
                                    height: 65,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                              // Text(
                                              //   '25 Uni retirada',
                                              //   style: TextStyle(
                                              //     color: Colors.black,
                                              //     fontSize: 11,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 21, bottom: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '22 Unidades retirada',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 164, 25, 15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: double.infinity,
                                    height: 65,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                              // Text(
                                              //   '25 Uni retirada',
                                              //   style: TextStyle(
                                              //     color: Colors.black,
                                              //     fontSize: 11,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 21, bottom: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '23 Unidades retirada',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 164, 25, 15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: double.infinity,
                                    height: 65,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                              // Text(
                                              //   '25 Uni retirada',
                                              //   style: TextStyle(
                                              //     color: Colors.black,
                                              //     fontSize: 11,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 21, bottom: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '24 Unidades retirada',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 164, 25, 15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawer: Drawer(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            "Adicionar itens",
                            style: TextStyle(fontSize: 21),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context); //remover a aba
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adicionarItem()),
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
                        height: 100,
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            " teste Pesquisar",
                            style: TextStyle(fontSize: 21),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context); //remover a aba
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPesquisa()),
                          );
                        },
                      ),
                      // InkWell(
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(vertical: 10),
                      //     child: const Text(
                      //       "Editar",
                      //       style: TextStyle(fontSize: 21),
                      //     ),
                      //   ),
                      //   onTap: () {
                      //     Navigator.pop(context); //remover a aba
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder:   (context) => const Pesquisar()),
                      //     );
                      //   },
                      // ),Night of the Dead
                      const SizedBox(
                        height: 100,
                      ),
                      const Divider(),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: const Wrap(
                                    children: [
                                      Text('Você sairá do aplicativo!'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                          'Deseja realmente sair do aplicativo ?'),
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
        });
  }
}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> getItens() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('Itens adicionados').get();

      List<Map<String, dynamic>> itens = [];

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        itens.add(doc.data() as Map<String, dynamic>);
      }

      return itens;
    } catch (e) {
      print('Erro ao obter itens: $e');
      return [];
    }
  }
}
