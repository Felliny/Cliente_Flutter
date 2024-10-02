import 'package:flutter/material.dart';
import 'package:teste1/controller/consulta_controller.dart';

import '../model/cliente.dart';


class ConsultarTela extends StatefulWidget{
  const ConsultarTela({super.key});

  @override
  State<ConsultarTela> createState() {
    return _ConsultarTelaState();
  }
}

class _ConsultarTelaState extends State<ConsultarTela> {
  ConsultaController controller = ConsultaController();

  List<Cliente> list= [];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    List<Cliente> clientes= await controller.carregaClientes();
    setState(() {
      list= clientes;
    });
  }

  @override
  Widget build(BuildContext context) {

    final TextEditingController tfNome= TextEditingController();
    final TextEditingController tfTelefone= TextEditingController();
    final TextEditingController tfTipo= TextEditingController();

    const double headTable= 150;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: [
            Table(
              border: TableBorder.all(color: Colors.black),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              defaultColumnWidth: const FixedColumnWidth(headTable),
              children: [
                const TableRow(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          'Nome',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                for (Cliente cliente in list)
                  TableRow(
                    children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.5),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black
                              ),
                              enabled: false,
                              initialValue: cliente.nome,
                              enableInteractiveSelection: false,
                            ),
                          )
                      ),
                    ]
                  )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  border: TableBorder.all(color: Colors.black),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  defaultColumnWidth: const FixedColumnWidth(headTable),
                  children: [
                    const TableRow(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                        ),
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Text(
                                'Telefone',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Text(
                                'Tipo',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Text(
                                'AAAAAAAAAAA',
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                    for (Cliente cliente in list)
                      TableRow(
                          children: [
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3.5),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    initialValue: cliente.telefone,
                                    enableInteractiveSelection: false,
                                  ),
                                ),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3.5),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    initialValue: cliente.tipo,
                                    enableInteractiveSelection: false,
                                  ),
                                ),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3.5),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none
                                    ),
                                    initialValue: "aa",
                                    enableInteractiveSelection: false,
                                  ),
                                ),
                            ),
                          ]
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}

