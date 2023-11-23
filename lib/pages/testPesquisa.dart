import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/EditItemPage.dart';
import 'dart:async';

class MyPesquisa extends StatefulWidget {
  @override
  MyPesquisaState createState() => MyPesquisaState();
}

class MyPesquisaState extends State<MyPesquisa> {
  late QuerySnapshot _snapshot;
  late StreamController<List<Item>> _itensController;
  List<Item> _itens = [];
  List<Item> _itensFiltrados = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _itensController = StreamController<List<Item>>.broadcast();
    _carregarDados();
  }

  void editarItem(Item item) {
    // Navigator.of(context).push(
    //   // MaterialPageRoute<void>(
    //   //   // builder: (BuildContext context) {
    //   //   //   // Aqui você instancia a tela de edição e passa o item para ela
    //   //   //   // return EditItemPage(item: item);
    //   //   // },
    //   // ),
    // );
  }

  Future<void> retirarUnidade(Item item) async {
    if (item.quantidade > 0) {
      item.quantidade--;

      await _atualizarQuantidadeNoFirestore(item);
    } else {
      print('A quantidade já é zero.');
    }
  }

  Future<void> _atualizarQuantidadeNoFirestore(Item item) async {
    try {
      await FirebaseFirestore.instance
          .collection('Itens adicionados')
          .doc(item.documentId)
          .update({
        'quantidade': item.quantidade,
      });
      print('Quantidade do item atualizada com sucesso.');
    } catch (e) {
      print('Erro ao atualizar a quantidade do item: $e');
      // Adicione tratamento de erro conforme necessário
    }
  }

  // void retirarUnidades(Item item) {
  //   // Verifica se a quantidade do item é maior que zero
  //   if (item.quantidade > 0) {
  //     // Diminui a quantidade do item em uma unidade
  //     item.quantidade--;

  //     // Salva a quantidade do item no Firestore
  //     FirebaseFirestore.instance
  //         .collection('Itens adicionados')
  //         .doc()
  //         .get()
  //         .then((DocumentSnapshot document) {
  //       if (document.exists) {
  //         // Atualizar o documento
  //         FirebaseFirestore.instance
  //             .collection('Itens adicionados')
  //             .doc('0')
  //             .update({
  //           'nome': 'novo nome',
  //           'quantidade': 10,
  //         });
  //       } else {
  //         // O documento não existe
  //         print('O documento não existe');
  //       }
  //     });
  //   }
  // }

  Future<void> apagarItem(BuildContext context, String documentId) async {
    try {
      // Referência para a coleção no Firestore
      CollectionReference collection =
          FirebaseFirestore.instance.collection('Itens adicionados');

      // Excluir o documento usando o documentId fornecido
      await collection.doc(documentId).delete();

      // Mostrar uma mensagem de sucesso (opcional)
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Item removido com sucesso!"),
        ),
      );
    } catch (e) {
      // Tratar erros, se necessário
      print('Erro ao remover item: $e');

      // Mostrar uma mensagem de erro (opcional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao remover o item."),
        ),
      );
    }
  }

  Future<void> _carregarDados() async {
    try {
      // Obtenha a coleção de Firestore e aguarde a conclusão
      _snapshot = await FirebaseFirestore.instance
          .collection('Itens adicionados')
          .get();

      setState(() {
        // Converta os documentos em uma lista de itens
        _itens = _snapshot.docs.map((documento) {
          Map<String, dynamic> dados = documento.data() as Map<String, dynamic>;

          // ignore: unnecessary_null_comparison
          if (dados == null) {
            return Item(
              nome: '',
              quantidade: 0,
              bandeja: '',
              documentId: documento.id,
            );
          }

          String? nome = dados['Nome produto'] as String?;
          int? quantidade = dados['quantidade'] as int?;
          String? bandeja = dados['disponivel'] as String?;

          return Item(
            nome: nome ?? '',
            quantidade: quantidade ?? 0,
            bandeja: bandeja ?? '',
            documentId: documento.id,
          );
        }).toList();
      });
    } catch (e) {
      // Trate possíveis erros aqui
      print('Erro ao carregar dados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''), //acho que vou tirar
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextField(
                controller: _searchController,
                style: TextStyle(fontSize: 21, decorationColor: Colors.white),
                onChanged: (value) {
                  // Filtra os itens com base no texto da pesquisa
                  _filtrarItens(value);
                },
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  contentPadding: EdgeInsets.only(top: 18),
                ),
              ),
            ),
            Expanded(
              child: _itensFiltrados.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _itensFiltrados.length,
                      itemBuilder: (context, index) {
                        final item = _itensFiltrados[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            title: Text(item.nome),
                            subtitle: Text(
                                '${item.quantidade} unidades - ${item.bandeja}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Editar item
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Retirar unidade
                                    retirarUnidade(item);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Apagar item
                                    apagarItem(context, item.documentId);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 185, 24, 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ));
  }

  void _filtrarItens(String filtro) {
    setState(() {
      _itensFiltrados = _itens
          .where(
              (item) => item.nome.toLowerCase().contains(filtro.toLowerCase()))
          .toList();
    });
  }
}

class Item {
  String documentId;
  String nome;
  String? bandeja;
  int quantidade;

  Item({
    required this.documentId,
    required this.nome,
    this.bandeja,
    required this.quantidade,
  });

  Item.fromFirestore(Map<String, dynamic> map, String documentId)
      : nome = map['Nome produto'] ?? '',
        quantidade = map['quantidade'] ?? 0,
        bandeja = map['disponivel'] ?? '',
        documentId = documentId;

  Map<String, dynamic> toFirestore() {
    return {
      'Nome produto': nome,
      'quantidade': quantidade,
      'disponivel': bandeja,
    };
  }
}
