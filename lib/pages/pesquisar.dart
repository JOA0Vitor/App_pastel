import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:trilhaapp/pages/adicionarItem.dart';
//lib search https://pub.dev/packages/flutter_typeahead
//https://ctupa7.medium.com/flutter-search-using-bloc-and-firestore-32aef4b9512c

class Pesquisar extends StatefulWidget {
  const Pesquisar({super.key});

  @override
  State<Pesquisar> createState() => _PesquisarState();
}

final List<Item> itens = [
  Item(
    id: 1,
    nome: 'Pastel de queijo',
    /* disponivel: true */
    quantidade: 17,
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(
                        fontSize: 21, decorationColor: Colors.white70),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                      labelText: 'Buscar:',
                      labelStyle: TextStyle(fontSize: 19),
                      contentPadding:
                          EdgeInsets.only(top: 15, bottom: 15, left: 7),
                    ),
                    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                    onChanged: (Text) {},
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (context, index) {
                          final item = itens[index];
                          return Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    color: Colors.black, width: 1),
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
                                        SizedBox(
                                          width: 196,
                                          child: Text(
                                            item.nome,
                                            style:
                                                const TextStyle(fontSize: 19),
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
                                              onPressed: () {
                                                // ignore: avoid_print
                                                print(
                                                    'Clicou no ícone de editar');
                                              },
                                              icon: const Icon(
                                                Icons.create_rounded,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // ignore: avoid_print
                                                print(
                                                    'Clicou no ícone de remover');
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext bc) {
                                                      return AlertDialog(
                                                        elevation: 8,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        content: Wrap(
                                                          children: [
                                                            const Text(
                                                                'Quantas Unidades você quer retirar ?'),
                                                            const SizedBox(
                                                              height: 50,
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 15,
                                                              ),
                                                              child: SpinBox(
                                                                min: 1,
                                                                max: 1000,

                                                                // ignore: avoid_print
                                                                onChanged:
                                                                    (value) {
                                                                  setState(
                                                                      () {});
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  // border: InputBorder.none,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Cancelar')),
                                                          TextButton(
                                                              onPressed: () {},
                                                              child: const Text(
                                                                  'Retirar'))
                                                        ],
                                                      );
                                                    });
                                              },
                                              icon: const Icon(
                                                Icons.do_disturb_on_rounded,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // ignore: avoid_print
                                                print(
                                                    'Clicou no ícone de remover');
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext bc) {
                                                      return AlertDialog(
                                                        elevation: 8,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        content: const Text(
                                                            'Tem certeza que quer remover este item ?'),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Cancelar')),
                                                          TextButton(
                                                              onPressed: () {},
                                                              child: const Text(
                                                                  'Sim'))
                                                        ],
                                                      );
                                                    });
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Color.fromARGB(
                                                    255, 165, 29, 29),
                                                size: 24,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )));
  }
}
