

import 'package:cloud_firestore/cloud_firestore.dart';

class Cliente{
  final String nome;
  final String telefone;
  final String tipo;

  Cliente({required this.nome, required this.telefone, required this.tipo});


  // Transforma o cliente em formato Json, para ser armazenado no banco de dados
  toJson() {
    return {'nome': nome, 'telefone': telefone, 'tipo': tipo};
  }

  // Transforma o Cliente em um dado para ser lido pelo programa, passando de Json para formato objeto
  factory Cliente.fromDocument(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return Cliente(
      nome: data['nome'],
      telefone: data['telefone'],
      tipo: data['tipo']
    );
  }

}