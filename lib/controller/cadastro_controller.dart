import 'package:teste1/database/cadastro_dao.dart';
import 'package:teste1/model/cliente.dart';

class CadastroController{
  List<Cliente> list= [];

  // cadastra os clientes no banco de dados
  void cadastrar(String nome, String telefone, String tipo){
    Cliente cliente= Cliente(nome: nome, telefone: formatarTelefone(telefone), tipo: tipo);

    CadastroDao().cadastrarCliente(cliente: cliente);
  }

  // Carrega os clientes em uma lista
  void carregaClientes() async {
    list =  await CadastroDao().getClientes();
  }

  // Verifica se o Cliente inserido ja esta cadastrado
  bool verificarClientes(String nome) {
    for (Cliente cliente in list){
      if (cliente.nome == nome){
        return true;
      }
    }
    return false;
  }

  // Formata o telefone para (DD) 00000-0000
  String formatarTelefone(String telefone){
    String codigoArea = telefone.substring(0, 2);
    String parteMeio = telefone.substring(2, 7);
    String parteFinal = telefone.substring(7);

    // formatando o telefone
    return "($codigoArea) $parteMeio-$parteFinal";
  }



}