import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cliente.dart';

class CadastroDao {

  final _db = FirebaseFirestore.instance;

  Future cadastrarCliente({required Cliente cliente}) async{
    // referencia o documento no firebase
    final docCliente = _db.collection('Cliente').doc(cliente.nome);

    await docCliente.set(cliente.toJson()); // armazena o cliente no banco de dados
  }

  Future<List<Cliente>> getClientes() async {
    QuerySnapshot querySnapshot = await _db.collection('Cliente').get(); // adquire os dados de uma coleção no banco de dados
    List<Cliente> list = querySnapshot.docs.map((doc) => Cliente.fromDocument(doc)).toList(); // adquire uma lista de todos os clientes

    return list;
  }



}