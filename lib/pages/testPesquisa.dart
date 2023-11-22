import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/EditItemPage.dart';

class MyPesquisa extends StatefulWidget {
  @override
  MyPesquisaState createState() => MyPesquisaState();
}

class MyPesquisaState extends State<MyPesquisa> {
  late QuerySnapshot _snapshot;

  List<Item> _itens = [];
  List<Item> _itensFiltrados = [];

  TextEditingController _searchController = TextEditingController();

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
    // Verifica se a quantidade do item é maior que zero

    if (item.quantidade > 0) {
      // Diminui a quantidade do item em uma unidade
      item.quantidade--;

      // Atualiza a quantidade no Firestore
      await _atualizarQuantidadeNoFirestore(item);
    } else {
      // Caso a quantidade já seja zero, você pode lidar com isso de maneira específica
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

  Future<void> apagarItem(BuildContext context, Item item) async {
    bool confirmado = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Você realmente deseja excluir este item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );

    if (confirmado == true) {
      try {
        // Exclui o documento do Firestore
        await FirebaseFirestore.instance
            .collection('Itens adicionados')
            .doc(item.documentId) //olhar esse document
            .delete();

        print('Item excluído com sucesso.');
      } catch (e) {
        print('Erro ao excluir o item: $e');
        // Adicione tratamento de erro conforme necessário
      }
    } else {
      print('Exclusão cancelada pelo usuário.');
    }
  }

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  // Future<void> _carregarDados() async {
  //   try {
  //     // Obtenha a coleção de Firestore e aguarde a conclusão
  //     _snapshot = await FirebaseFirestore.instance
  //         .collection('Itens adicionados')
  //         .get();

  //     setState(() {
  //       // Converta os documentos em uma lista de itens
  //       _itens = _snapshot.docs.map((documento) {
  //         Map<String, dynamic> dados = documento.data() as Map<String, dynamic>;

  //         // ignore: unnecessary_null_comparison
  //         if (dados == null) {
  //           return Item(
  //             nome: '',
  //             quantidade: 0,
  //             documentId: documento.id,
  //           ); //olhar aqui
  //         }

  //         String? nome = dados['Nome produto'] as String?;
  //         int? quantidade = dados['quantidade'] as int?;

  //         return Item(
  //           nome: nome ?? '',
  //           quantidade: quantidade ?? 0,
  //           documentId: documento.id,

  //         );
  //       }).toList();
  //     });
  //   } catch (e) {
  //     // Trate possíveis erros aqui
  //     print('Erro ao carregar dados: $e');
  //   }
  // }

  Future<void> _carregarDados() async {
    try {
      // Obtenha a coleção de Firestore e aguarde a conclusão
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Itens adicionados')
          .get();

      setState(() {
        // Converta os documentos em uma lista de itens
        _itens = snapshot.docs.map((documento) {
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
                                    apagarItem(context, item);
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
