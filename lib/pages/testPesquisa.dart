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
          .doc(item.toString())
          .update({
        'quantidade': item.quantidade,
      });
      print('Quantidade do item atualizada com sucesso.');
    } catch (e) {
      print('Erro ao atualizar a quantidade do item: $e');
      // Adicione tratamento de erro conforme necessário
    }
  }

  // void retirarUnidade(Item item) {
  //   // Verifica se a quantidade do item é maior que zero
  //   if (item.quantidade > 0) {
  //     // Diminui a quantidade do item em uma unidade
  //     item.quantidade--;

  //     // Salva a quantidade do item no Firestore
  //     FirebaseFirestore.instance
  //         .collection('Itens adicionados')
  //         .doc('UCCGM8xX7pEMyvlk7qPb')
  //         .get()
  //         .then((DocumentSnapshot document) {
  //       if (document.exists) {
  //         // Atualizar o documento
  //         FirebaseFirestore.instance.collection('items').doc('0').update({
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
    // Mostra um diálogo de confirmação
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
        final id = item.id;

        // Exclui o documento do Firestore
        await FirebaseFirestore.instance
            .collection('items')
            .doc(id.toString())
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
            return Item(id: 0, nome: '', quantidade: 0);
          }

          int? id = dados['id'] as int?;
          String? nome = dados['name'] as String?;
          int? quantidade = dados['quantidade'] as int?;

          return Item(
            id: id ?? 0,
            nome: nome ?? '',
            quantidade: quantidade ?? 0,
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
        title: Text('Menu'),
      ),
      body: _itens.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _itens.length,
              itemBuilder: (context, index) {
                final item = _itens[index];
                print('pegou??');
                return ListTile(
                  title: Text(item.nome),
                  subtitle: Text('${item.quantidade} unidades'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Editar item
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          // Retirar unidade
                          retirarUnidade(item);
                        },
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      IconButton(
                        onPressed: () {
                          // Apagar item
                          apagarItem;
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class Item {
  int id;
  String nome;
  int quantidade;

  Item({
    required this.id,
    required this.nome,
    required this.quantidade,
  });
}
