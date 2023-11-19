import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> lerDados() async {
  CollectionReference item = FirebaseFirestore.instance.collection('itens');

  QuerySnapshot querySnapshot = await item.get();

  querySnapshot.docs.forEach((doc) {
    print('Nome: ${doc['nome']}, Quantidade: ${doc['quantidade']}');
  });
}

void adicionarDados(String nome, int quantidade, int id) {
  FirebaseFirestore.instance.collection('meusItens').add({
    'id': id,
    'name': nome,
    'quantidade': quantidade,
  });
}
