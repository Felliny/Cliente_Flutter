import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cliente.dart';

class ConsultaDao {

  final _db = FirebaseFirestore.instance;

  Future<List<Cliente>> getClientes() async {
    QuerySnapshot querySnapshot= await _db.collection('Cliente').get();
    List<Cliente> list = querySnapshot.docs.map((doc) => Cliente.fromDocument(doc)).toList(); // adquire uma lista de todos os clientes

    return list;
  }

}