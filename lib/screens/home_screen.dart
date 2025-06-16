import 'package:flutter/material.dart';
import '../components/card_computador.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final computadores = [
      {
        "nome": "Dell G15",
        "descricao": "Ryzen 5, 16GB RAM, RTX 3060",
        "imagem": "https://images.app.goo.gl/ooQAFmysB9CmLVKE9",
      },
      {
        "nome": "Notebook Pro",
        "descricao": "Intel i7, 8GB RAM, SSD 512GB",
        "imagem": "https://images.app.goo.gl/ooQAFmysB9CmLVKE9",
      },
      {
        "nome": "Servidor Dell",
        "descricao": "Xeon, 64GB RAM, RAID 1TB",
        "imagem": "https://images.app.goo.gl/ooQAFmysB9CmLVKE9",
      },
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView(
        padding: EdgeInsets.all(12) ,
        children: computadores.map((comp) {
          return CardComputador(
            nome: comp["nome"]!,
            descricao: comp["descricao"]!,
            // imagem: comp["imagem"]!,
          );
        }).toList(),
      ),
    );
  }
}
