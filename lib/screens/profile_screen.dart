import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TelaUsuario()));
}

class TelaUsuario extends StatelessWidget {
  const TelaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  'lib/assets/logo.png', // Ícone do app
                  width: 50,
                  height: 50,
                ),
              ],
            ),

            SizedBox(width: 8),
            Text('Meu Perfil', style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            iconSize: 35,
            onPressed: () {
              // Ação para abrir a tela de configurações
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Perfil
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'lib/assets/usuario.png',
                      ), // Foto do usuário
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'José Vieira',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'jose@email.com',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),

                Text(
                  'Histórico de Aluguéis',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                // Aluguel Finalizado
                buildAluguelCard(
                  nome: 'Notebook Acer Nitro',
                  data: '10/06/2025',
                  duracao: '2 horas',
                  status: 'Finalizado',
                  statusColor: Colors.green,
                  imagem: 'lib/assets/acer.png',
                ),
                SizedBox(height: 8),

                // Aluguel em andamento
                buildAluguelCard(
                  nome: 'Notebook Dell G15',
                  data: '08/06/2025',
                  duracao: '1 hora',
                  status: 'Em andamento',
                  statusColor: Colors.orange,
                  imagem: 'lib/assets/pc1.png',
                ),
                SizedBox(height: 24),

                // Botões lado a lado
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Ação para zerar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Zerar Histórico'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            final TextEditingController feedbackController =
                                TextEditingController();
                            return AlertDialog(
                              title: Text('Enviar Feedback'),
                              content: TextField(
                                controller: feedbackController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: 'Digite aqui...',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final feedback = feedbackController.text;
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Feedback enviado: $feedback',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Enviar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Enviar Feedback'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAluguelCard({
    required String nome,
    required String data,
    required String duracao,
    required String status,
    required Color statusColor,
    required String imagem,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagem,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nome, style: TextStyle(fontSize: 16, color: Colors.white)),
                Text(
                  'Data: $data',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Text(
                  'Duração: $duracao',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(status, style: TextStyle(color: statusColor)),
        ],
      ),
    );
  }
}
