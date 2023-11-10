import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:trilhaapp/pages/adicionarItem.dart';
//lib search https://pub.dev/packages/flutter_typeahead
//https://ctupa7.medium.com/flutter-search-using-bloc-and-firestore-32aef4b9512c

class consultarEstoque extends StatefulWidget {
  const consultarEstoque({super.key});

  @override
  State<consultarEstoque> createState() => _consultarEstoqueState();
}

final List<Item> itens = [
  Item(
    id: 1,
    nome: 'Pastel de queijo',
    quantidade: 17, /* disponivel: true */
  ),
  Item(
    id: 2,
    nome: 'Pastel de charque c/ queijo',
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
    nome: 'Pastel de frango c/ bacon',
    quantidade: 32, /* disponivel: true */
  ),
  Item(
    id: 6,
    nome: 'Pastel de carne c/ queijo',
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

class _consultarEstoqueState extends State<consultarEstoque> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("consultar Estoque"),
              backgroundColor: const Color.fromARGB(255, 2, 133, 255),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                        title: Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 80, //talvez mude o tamanho
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // ignore: sized_box_for_whitespace
                                  Container(
                                    width: 196,
                                    child: Text(
                                      item.nome,
                                      style: const TextStyle(fontSize: 19),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Text(
                                    'ID: ${item.id} ',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 0,
                              // ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Text(
                                        '${item.quantidade}',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 7, 94, 255)),
                                      ),
                                      const Text(' Uni Disponível'),
                                    ],
                                  )),
                                  Row(
                                    children: [
                                      IconButton(
                                        // splashColor: Colors
                                        //     .transparent, //talvez eu tire o zoom
                                        onPressed: () {
                                          // ignore: avoid_print
                                          print('Clicou no ícone de editar');
                                        },
                                        icon: const Icon(
                                          Icons.create_rounded,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // ignore: avoid_print
                                      print('Clicou no ícone de remover');
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return AlertDialog(
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              title: const Text(
                                                'Remover Item',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: Wrap(
                                                children: [
                                                  const Text(
                                                      'Quantas Unidades você quer retirar ?'),
                                                  Container(
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 15,
                                                    ),
                                                    child: SpinBox(
                                                      min: 1,
                                                      max: 1000,

                                                      // ignore: avoid_print
                                                      onChanged: (value) {
                                                        setState(() {});
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        // border: InputBorder.none,
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 80,
                                                  ),
                                                  const Text(
                                                      'Remover o item: '),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    width: double.infinity,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: const Text(
                                                        'Remover tudo !!',
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text('Cancelar')),
                                                TextButton(
                                                    onPressed: () {},
                                                    child:
                                                        const Text('Remover'))
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 165, 29, 29),
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    // ignore: dead_code, unused_label
                  }

                  // )
                  ),
            )));
    // ignore: dead_code
  }
}
