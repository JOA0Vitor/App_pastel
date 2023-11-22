import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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

class Item {
  final int id;
  final String nome;
  int quantidade;

  Item({required this.id, required this.nome, required this.quantidade});
}

_removerItem(Item item) async {
  // ta pegando so com codigo(id) do firebase
  //esse ta pronto
  await Firebase.initializeApp();
  var collection = FirebaseFirestore.instance.collection('Itens adicionados');
  collection
      .doc() //o erro ta aqui, ele nao ta conseguindo pegar o item
      .delete()
      .then((value) => print('Item removido com sucesso'))
      .catchError((error) => print('Erro ao remover item: ${error.message}'));
}

void _retirarItem(
  Item item,
) {
  //ta retirando por click, e nao por unidade selecionada

  FirebaseFirestore.instance
      .collection('Itens adicionados')
      .doc('UCCGM8xX7pEMyvlk7qPb')
      .update({'quantidade': item.quantidade - 1});
  // Exemplo hipotético:
}

// Future<void> _removerItem(Item item) async {
//   try {
//     await Firebase.initializeApp();

//     var collection = FirebaseFirestore.instance.collection('Itens adicionados');

//     // Use o id do item para identificar o documento
//     var documentId = item.toString();

//     await collection
//         .doc(documentId)
//         .delete()
//         .then((value) => print('Item removido com sucesso'))
//         .catchError((error) => print('Erro ao remover item: ${error.message}'));
//   } catch (e) {
//     print("Erro geral: $e");
//   }
// }

class _PesquisarState extends State<Pesquisar> {
  int quantidadeSelecionada = 1;

  @override
  Widget build(BuildContext context) {
    void diminuirUnidade(BuildContext context) async {
      // ignore: unused_local_variable
      int quantidadeSelecionada = 1;
    }

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Itens adicionados')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<Item> itens =
              snapshot.data!.docs.map((DocumentSnapshot documento) {
            Map<String, dynamic> dados =
                documento.data() as Map<String, dynamic>;

            // ignore: unnecessary_null_comparison
            if (dados == null) {
              return Item(id: 0, nome: '', quantidade: 0);
            }

            int? id = dados['id'] as int?;
            String? nome = dados['name'] as String?;
            int? quantidade = dados['quantidade'] as int?;

            return Item(
              id: id ?? 0,
              nome: nome ??= '',
              quantidade: quantidade ??= 0,
            );
          }).toList();

          return SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    title: const Text("Pesquisar"),
                    backgroundColor: const Color.fromARGB(255, 2, 133, 255),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 196,
                                                  child: Text(
                                                    item.nome,
                                                    style: const TextStyle(
                                                        fontSize: 19),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Text(
                                                  'ID: ${item.id} ',
                                                  textAlign: TextAlign.end,
                                                  style: const TextStyle(
                                                      fontSize: 11),
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
                                                    const Text(
                                                        ' Uni Disponível'),
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
                                                        _retirarItem(item);
                                                        print(
                                                            'Clicou no ícone de retirar');
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    bc) {
                                                              return AlertDialog(
                                                                elevation: 8,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                content: Wrap(
                                                                  children: [
                                                                    const Text(
                                                                        'Quantas Unidades você quer retirar ?'),
                                                                    const SizedBox(
                                                                      height:
                                                                          50,
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                        top: 15,
                                                                      ),
                                                                      child:
                                                                          SpinBox(
                                                                        min: 1,
                                                                        max:
                                                                            1000,
                                                                        value: quantidadeSelecionada
                                                                            .toDouble(),

                                                                        // ignore: avoid_print
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            quantidadeSelecionada =
                                                                                value.toInt();
                                                                          });
                                                                        },
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          'Cancelar')),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'Retirar $quantidadeSelecionada unidades');
                                                                      },
                                                                      child: const Text(
                                                                          'Retirar'))
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      icon: const Icon(
                                                        Icons //icon retirar
                                                            .do_disturb_on_rounded,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: Color.fromARGB(
                                                            255, 165, 29, 29),
                                                        size: 24,
                                                      ),
                                                      onPressed: () {
                                                        _removerItem(item);

                                                        setState(() {});

                                                        // showDialog(
                                                        //     context: context,
                                                        //     builder:
                                                        //         (BuildContext
                                                        //             bc) {
                                                        //       return AlertDialog(
                                                        //         title: const Text(
                                                        //             'Remover Item'),
                                                        //         elevation: 8,
                                                        //         shape: RoundedRectangleBorder(
                                                        //             borderRadius:
                                                        //                 BorderRadius.circular(
                                                        //                     10)),
                                                        //         content: const Text(
                                                        //             'Tem certeza que quer remover este item ?'),
                                                        //         actions: [
                                                        //           TextButton(
                                                        //               onPressed:
                                                        //                   () {
                                                        //                 Navigator.pop(
                                                        //                     context);
                                                        //               },
                                                        //               child: const Text(
                                                        //                   'Cancelar')),
                                                        //           TextButton(
                                                        //               onPressed:
                                                        //                   () {
                                                        //                 itensExibidos
                                                        //                     .remove(item);

                                                        //                 _removerItem(
                                                        //                     item);

                                                        //                 Navigator.of(context)
                                                        //                     .pop();
                                                        //               },
                                                        //               child: const Text(
                                                        //                   'Sim'))
                                                        //         ],
                                                        //       );
                                                        //     });
                                                      },
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
                                })),
                      ],
                    ),
                  )));
        });
  }
}
