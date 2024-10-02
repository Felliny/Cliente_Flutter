import 'package:flutter/material.dart';
import 'package:teste1/controller/cadastro_controller.dart';

CadastroController controller= CadastroController();

class CadastrarTela extends StatefulWidget{
  // StatefulWidget é um janela que é alterada com forme o uso
  const CadastrarTela({Key? key}) : super(key: key);

  @override
  State<CadastrarTela> createState() => _CadastrarTelaState();
}

class _CadastrarTelaState extends State<CadastrarTela> {
  final _cadastrarTelaEstado = GlobalKey<FormState>();

  String nome = ''; // variavel para armazenar o dado do textfield nome
  String telefone = ''; // variavel para armazenar o dado do textfield telefone
  String dropdownvalue = "Normal"; // valor do dropdownvalue inicial

  final textFieldNome = TextEditingController();
  final textFieldTelefone = TextEditingController();
  // objetos usados para poder editar os textfield
  // sendo utilizado para limpar os campos

  void clearTextField(){
    textFieldNome.clear();
    textFieldTelefone.clear();
  }
  // metodo que limpa os campos

  @override
  Widget build(BuildContext context) {
    refresh(); // Toda vez que essa pagina é carrega, um refresh é realizado para se adquirir os clientes ja cadastrados
    return Scaffold(
      appBar: AppBar( // barra que aparece em cima
        title: const Text("Cadastrar"),
        centerTitle: true,
      ),
      body: Padding( // utilizado para separar as janelas
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _cadastrarTelaEstado,
          child: Column(
            children: [ // filhos da Collumn
              TextFormField(
                // decoration é utilizado para alterar a aparencia do textfield
                // e outros, aqui é utilizado para colocar borda no textfield e
                // colocar uma dica dentro dele
                decoration: const InputDecoration(
                    labelText: "Digite o nome",
                    border: OutlineInputBorder()
                ),
                onChanged: (value){
                  // quando o valor dentro do textfield é alterado
                  // o valor é armazenado dentro da variavel nome
                  nome = value;
                },
                controller: textFieldNome,
                validator: verificaNome, // verifica se o nome não esta vazio
                // define o controller do textfield, podendo limpar o seu conteudo
              ),

              // caixa usada para separar os textfields, deixando melhor para a
              // leitura
              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(labelText: "Digite o telefone",
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number, // define para se digitar apenas numeros
                maxLength: 11, // define a largura maxima
                onChanged: (value){
                  telefone = value;
                },
                controller: textFieldTelefone,
                validator: verificaTelefone, // verifica se um telefone esta correto
                // define o controller do textfield, podendo limpar o seu conteudo
              ),

              const SizedBox(height: 20),
              // caixa usada para separar os textfields, deixando melhor para a
              // leitura

              // container é utilizado para alterar as suas janelas/filhos de forma
              // mais aberta
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                // adiciona um borda com boxDecoration
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  // o tamanho e a cor da borda
                  borderRadius: BorderRadius.circular(12),
                  // a expessura da borda
                ),
                child: DropdownButtonHideUnderline(
                  // DropdownButtonHideUnderline é utilizado para tirar a linha
                  // que fica debaixo do botão de seleção, deixando mais bonito
                  child: DropdownButton<String>(
                    isExpanded: true, // define que expandido para os lados
                    value: dropdownvalue, // define o valor inicial
                    items: const [
                      // items que vão aparecer do dropdown
                      DropdownMenuItem(
                          value: "Normal",
                          child: Text("Normal")),
                      DropdownMenuItem(
                          value: "Especial",
                          child: Text("Especial")),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        // setState é utilizado para atualizar a tela
                        dropdownvalue = value!;
                        // armazena o valor do dropdown na variavel
                      });
                    },
                  ),
                )
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                  onPressed: (){ // quando pressionado
                    setState(() {
                      if (_cadastrarTelaEstado.currentState!.validate()){
                        // setState é utilizado para atualizar a tela
                        if (!verificarCliente()) {
                          cadastrarCliente();
                          // chama a função para cadastrar

                          clearTextField();
                          // chama a função para limpar os campos

                          // Aparece uma menssagem que dura 2 segundos, embaixo da tela
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Cliente Cadastrado!",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          ); //menssagem
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Este cliente já esta cadastrado!",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                            // Aparece uma menssagem que dura 2 segundos, embaixo da tela
                          ); //menssagem
                        }
                      }

                    });
                    }, // evento do botao
                  style: ElevatedButton.styleFrom(
                    // muda o estilo do botão
                    // padding muda a localização do texto
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    // textStyle muda o estilo do texto
                    textStyle: const TextStyle(fontSize: 20),
                    // foregroundColor muda a cor do texto
                    foregroundColor: Colors.black
                  ),
                  // este é o filho do botão, sendo o texto escrito cadastrar
                  child: const Text("Cadastrar"))
            ],
          ),
        ),
      ),
    );
  }

  // carrega a lista de clientes
  void refresh(){
    controller.carregaClientes();
  }

  // Funções para os eventos
  void cadastrarCliente(){
    controller.cadastrar(nome, telefone, dropdownvalue);
  }

  // verifica se o cliente ja esta cadastrado
  bool verificarCliente() {
    return controller.verificarClientes(nome);
  }

  // verifica se o nome não esta vazio
  String? verificaNome(String? nome){
    if (nome == ''){
      return 'Digite o nome do cliente';
    }
    return null;
  }

  // verificar se o telefone so possui numeros e não possui simbolos
  bool verificarApenasNumeros(String texto) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(telefone);
  }

  // verifica se o telefone esta correto
  String? verificaTelefone(String? telefone){
    if (!verificarApenasNumeros(telefone!)){
      return "Digite apenas Números";
    }
    else if (telefone == ''){
      return "Digite o telefone do cliente";
    }
    else if (telefone.length != 11){
      return "Tamanho do número inválido";
    }
    return null;
  }
}