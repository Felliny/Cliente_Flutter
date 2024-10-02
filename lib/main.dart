import 'package:flutter/material.dart';
import 'package:teste1/pages/cadastrar_tela.dart';
import 'package:teste1/pages/consultar_tela.dart';
import 'package:teste1/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // retorna um materialApp utilizado pela google
      theme: ThemeData( // atribui o thema ao aplicaitivo
        primarySwatch: Colors.lightBlue,
        useMaterial3: true,
      ),
      home: HomePage(), // define que a classe Home é a pagina principal
      routes: { // rotas para nagevegar no aplicativo
        '/cadastrar' :(context) => const CadastrarTela(),
        '/consultar' :(context) => const ConsultarTela()
      },
      debugShowCheckedModeBanner: false, // para de aparecer o adesivo de debug na tela
    );
  }
}

