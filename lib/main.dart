import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculador de sumas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Calculador de sumas'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  double _resultado = 0;
  void _sumar() {
    final int num1 = int.parse(this.num1.text);
    final int num2 = int.parse(this.num2.text);
    setState(() {
      _resultado = (num1 + num2).toDouble();
    });
  }

  void _restar() {
    final int num1 = int.parse(this.num1.text);
    final int num2 = int.parse(this.num2.text);
    setState(() {
      _resultado = (num1 - num2).toDouble();
    });
  }

  void _multiplicar() {
    final int num1 = int.parse(this.num1.text);
    final int num2 = int.parse(this.num2.text);
    setState(() {
      _resultado = (num1 * num2).toDouble();
    });
  }

  void _dividir() {
    final int num1 = int.parse(this.num1.text);
    final int num2 = int.parse(this.num2.text);
    setState(() {
      _resultado = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_resultado',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Container(
              width: 250,
              child: Column(
                children: [
                  TextField(
                    controller: num1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Ingresa un número',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: num2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Ingresa un número',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(onPressed: _sumar, child: const Text('Sumar')),
                ElevatedButton(onPressed: _restar, child: const Text('Restar')),
                ElevatedButton(
                  onPressed: _multiplicar,
                  child: const Text('Multiplicar'),
                ),
                ElevatedButton(
                  onPressed: _dividir,
                  child: const Text('Dividir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
