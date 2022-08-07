import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => FormularioTransferencia();
}

class FormularioTransferencia extends State<MyCustomForm> {
  final controladorCampoNumeroConta = TextEditingController();
  final controladorCampoValor = TextEditingController();

  @override
  void dispose() {
    controladorCampoNumeroConta.dispose();
    controladorCampoValor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controladorCampoNumeroConta,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controladorCampoValor,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('Clicou no confirmar');

              final int? numeroConta =
                  int.tryParse(controladorCampoNumeroConta.text);

              final double? valor = double.tryParse(controladorCampoValor.text);

              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferência{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: const [
          ItemTransferencia(valor: 100.0, numeroConta: '1000'),
          ItemTransferencia(valor: 200.0, numeroConta: '1000'),
          ItemTransferencia(valor: 300.0, numeroConta: '1000'),
        ],
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final double valor;
  final String numeroConta;

  const ItemTransferencia(
      {Key? key, required this.valor, required this.numeroConta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(valor.toString()),
        subtitle: Text(numeroConta),
      ),
    );
  }
}
