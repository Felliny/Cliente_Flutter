import 'package:teste1/database/consulta_dao.dart';

import '../model/cliente.dart';

class ConsultaController {

  Future<List<Cliente>> carregaClientes() async {
    List<Cliente> list = await ConsultaDao().getClientes();

    return list;
  }
}