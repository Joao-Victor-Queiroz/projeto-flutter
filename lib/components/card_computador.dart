import 'package:flutter/material.dart';
import '../screens/pc_screen.dart'; // ou caminho absoluto

class CardComputador extends StatelessWidget {
  final String nome;
  final String descricao;

  const CardComputador({
    super.key,
    required this.nome,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotebookHomePage(nome: nome, descricao:descricao), // substitua por PcScreen(nome: nome, descricao: descricao) se for necessário passar dados
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Image.asset('lib/assets/pc1.png', width: 80, height: 60, fit: BoxFit.cover),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(descricao, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
