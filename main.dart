import 'package:flutter/material.dart';

import 'views/clientes.dart';
import 'views/contato.dart';
import 'views/empresa.dart';
import 'views/projetos.dart';
import 'views/servico.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AtmHome(),
  ));
}

class AtmHome extends StatelessWidget {
  const AtmHome({super.key});

  Widget criarMenu(
    BuildContext context,
    String titulo,
    String imagem,
    Widget tela,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tela),
        );
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagem, height: 75, fit: BoxFit.contain),
              const SizedBox(height: 8),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultoria ATM"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset("imagens/logo.png", height: 130),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                criarMenu(context, "Clientes",
                    "imagens/menu_cliente.png", const Clientes()),
                criarMenu(context, "Contato",
                    "imagens/menu_contato.png", const Contato()),
                criarMenu(context, "Empresa",
                    "imagens/menu_empresa.png", const Empresa()),
                criarMenu(context, "Serviços",
                    "imagens/menu_servico.png", const Servico()),
                criarMenu(context, "Projetos",
                    "imagens/menu_projeto.png", const Projetos()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
