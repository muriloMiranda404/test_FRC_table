import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late WebSocketChannel channel;
  String receivedData = "Aguardando dados...";

  @override
  void initState() {
    super.initState();

    // Substitua pelo IP do seu roboRIO (10.TE.AM.2)
    channel = WebSocketChannel.connect(
      Uri.parse('ws://10.42.68.2:5810/nt'), // Exemplo: Team 4268
    );

    // Envia solicitação de subscrição a uma chave (ex: /SmartDashboard/velocidade)
    channel.sink.add(jsonEncode({
      "type": "subscribe",
      "topics": ["/SmartDashboard/velocidade"],
    }));

    // Recebe os dados
    channel.stream.listen((message) {
      final decoded = jsonDecode(message);
      if (decoded["type"] == "publish") {
        final value = decoded["value"]["value"];
        setState(() {
          receivedData = "Velocidade: $value";
        });
      }
    });
  }

  void enviarValorParaRobo() {
    // Publica um novo valor no tópico desejado
    channel.sink.add(jsonEncode({
      "type": "publish",
      "topic": "/SmartDashboard/auto_mode",
      "value": {"type": "string", "value": "modo1"}
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard FRC")),
      body: Center(child: Text(receivedData)),
      floatingActionButton: FloatingActionButton(
        onPressed: enviarValorParaRobo,
        child: const Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
