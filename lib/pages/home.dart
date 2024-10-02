import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // StatelessWidget é uma janela sem alteração não utiliza o setState
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // A barra em cima
        title: const Text("Inicio"),
        centerTitle: true,
      ),
      drawer: Drawer( // o Menu da esquerda que aparece
        width: 230, // define a largura do drawer
        child: Padding(
          // define que deve se afastar somente o topo, para não ficar grudado
          // ao topo da tela do celular, utilizando o top: 25
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              ListTile( // recomendado para se utilizar no drawer
                  onTap: () {
                    // fecha o drawer
                    Navigator.pop(context);
                    // vai para tela de casdastro
                    Navigator.pushNamed(context, '/cadastrar');
                  },
                  // coloca um icone na esquerda
                  leading: const Icon(Icons.account_circle),
                  title: const Text("Cadastrar")
              ),
              ListTile(
                  onTap: (){
                    Navigator.pop(context);

                    Navigator.pushNamed(context, '/consultar');
                  },
                  leading: const Icon(Icons.table_view_outlined),
                  title: const Text("Consultar")
              ),
            ],
          ),
        ),
      ),
    );
  }
}