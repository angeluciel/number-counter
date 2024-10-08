import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(RandomNumberCounterApp());

class RandomNumberCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Number Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomNumberCounter(),
    );
  }
}

class RandomNumberCounter extends StatefulWidget {
  @override
  _RandomNumberCounterState createState() => _RandomNumberCounterState();
}

class _RandomNumberCounterState extends State<RandomNumberCounter> {
  int _randomNumber = 0;
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  void _generateRandomNumber() {
    int min = int.tryParse(_minController.text) ?? 0;  // Min default = 0
    int max = int.tryParse(_maxController.text) ?? 100; // Max default = 100
    
    if (min > max) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Mínimo deve ser maior que o máximo..."),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    setState(() {
      _randomNumber = min + Random().nextInt(max - min + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number Counter'),
        centerTitle: true, // centraliza o header (pq essa porra nn funciona com mainAxisAlignment???)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Número: $_randomNumber',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _minController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor Mínimo (Opcional)',
              ),
            ),
            TextField(
              controller: _maxController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor Máximo (Opcional)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateRandomNumber,
              child: Text('Gerar Número Aleatório'),
            ),
          ],
        ),
      ),
    );
  }
}
