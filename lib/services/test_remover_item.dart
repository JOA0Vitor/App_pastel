import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
