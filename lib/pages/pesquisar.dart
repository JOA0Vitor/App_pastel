import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/adicionarItem.dart';

class Pesquisar extends StatefulWidget {
  const Pesquisar({super.key});

  @override
  State<Pesquisar> createState() => _PesquisarState();
}

final List<Item> itens = [
  Item(
    id: 1,
    nome: 'Pastel de queijo',
    quantidade: 17, /* disponivel: true */
  ),
  Item(
    id: 2,
    nome: 'Pastel de charque com queijo',
    quantidade: 51, /* disponivel: true */
  ),
  Item(
    id: 3,
    nome: 'Pastel de carne',
    quantidade: 27, /* disponivel: true */
  ),
  Item(
    id: 4,
    nome: 'Pastel de camarão c/ catupiry',
    quantidade: 76, /* disponivel: true */
  ),
  Item(
    id: 5,
    nome: 'Pastel de frango com bacon',
    quantidade: 32, /* disponivel: true */
  ),
  Item(
    id: 6,
    nome: 'Pastel de carne com queijo',
    quantidade: 90, /* disponivel: true */
  ),
  Item(
    id: 7,
    nome: 'Pastel de queijo c/ calabresa',
    quantidade: 67, /* disponivel: true */
  ),
  Item(
    id: 8,
    nome: 'Pastel de charque',
    quantidade: 91, /* disponivel: true */
  ),
  Item(
    id: 9,
    nome: 'Pastel de franquijo',
    quantidade: 26, /* disponivel: true */
  ),
  Item(
    id: 10,
    nome: 'Pastel de bacalhau',
    quantidade: 65, /* disponivel: true */
  ),
  Item(
    id: 11,
    nome: 'Pastel de frango',
    quantidade: 68, /* disponivel: true */
  ),
  Item(
    id: 12,
    nome: 'Pastel de 3 queijos',
    quantidade: 49, /* disponivel: true */
  ),
  Item(
    id: 13,
    nome: 'Coxinha',
    quantidade: 54, /* disponivel: true */
  ),
];

class _PesquisarState extends State<Pesquisar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Pesquisar"),
              backgroundColor: const Color.fromARGB(255, 2, 133, 255),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
              // child: ListView.builder(
              //     itemCount: itens.length,
              //     itemExtent: 30,
              //     itemBuilder: (context, index) {
              //       // ignore: non_constant_identifier_names
              //       final Item = itens[index];
              //       return Text(
              //           "Id ${Item.id}, nome: ${Item.nome},  quantidade ${Item.quantidade}");
              //     }),

              child: ListView.builder(
                  itemCount: itens.length,
                  itemBuilder: (context, index) {
                    final item = itens[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.nome,
                                ),
                                Text(
                                  ' Id: ${item.id}',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Quantidade: ${item.quantidade}                     ',
                                ),
                                StreamBuilder<Object>(
                                    stream: null,
                                    builder: (context, snapshot) {
                                      return const Icon(
                                        Icons.create_rounded,
                                      );
                                    }),
                                const Icon(Icons.delete)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    // ignore: dead_code, unused_label
                  }

                  // child: ListView(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   children: [
                  //     ListTile(
                  //       title: const Text("nome do produto"),
                  //       subtitle: const Text("22 Quantidade"),
                  //       trailing: SizedBox(
                  //         width: 100,
                  //         height: 200,
                  //         child: Row(
                  //           children: [
                  //             IconButton(
                  //               icon: const Icon(Icons.edit),
                  //               onPressed: () {},
                  //             ),
                  //             IconButton(
                  //               icon: const Icon(Icons.delete),
                  //               onPressed: () {},
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),

                  //   ],
                  // )
                  ),
            )));
    // ignore: dead_code
  }
}
