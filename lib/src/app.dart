import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Interactiva',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _contador = 0;
  String _nombre = '';
  final TextEditingController _controlador = TextEditingController();

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _guardarNombre() {
    setState(() {
      _nombre = _controlador.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Interactiva'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                labelText: 'Escribe tu nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _guardarNombre,
              child: const Text('Guardar nombre'),
            ),
            const SizedBox(height: 24),
            Text(
              _nombre.isEmpty ? 'Aún no escribiste tu nombre' : 'Hola, $_nombre 👋',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Text(
              'Has presionado el botón:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '$_contador veces',
              style: const TextStyle(fontSize: 32, color: Colors.indigo),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementar,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}