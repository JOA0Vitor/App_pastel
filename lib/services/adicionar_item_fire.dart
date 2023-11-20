import 'package:cloud_firestore/cloud_firestore.dart';

void adicionarDados(
  int id,
  String nome,
  List<String> tipoDeBandeja,
  int quantidade,
) {
  FirebaseFirestore.instance.collection('Itens adicionados').add({
    'id': id,
    'name': nome,
    'tipoDeBandeja': tipoDeBandeja,
    'quantidade': quantidade,
  });
}
