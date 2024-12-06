
import 'package:flutter/material.dart';
import 'calculadora_imc_model.dart';

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({super.key, required this.title});

  final String title;

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  List<CalculadoraImcModel> calculadoraImc = [];
  final _idadeController = TextEditingController();
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: calculadoraImc.length, 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(calculadoraImc[index].getIMC()), 
            subtitle: Text('Idade: ${calculadoraImc[index].idade} Altura: ${calculadoraImc[index].altura} Peso: ${calculadoraImc[index].peso}'),
            leading: Icon(Icons.fitness_center), 
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            _idadeController.text = '';
            _alturaController.text = '';
            _pesoController.text = '';

            return AlertDialog(
              title: Text('Cálculo de IMC'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _idadeController,
                      decoration: InputDecoration(
                        labelText: 'Idade',
                        hintText: 'Digite sua idade',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: _alturaController,
                      decoration: InputDecoration(
                        labelText: 'Altura',
                        hintText: 'Digite sua altura',
                      ),
                       keyboardType: TextInputType.number,
                    ),
                                        TextField(
                      controller: _pesoController,
                      decoration: InputDecoration(
                        labelText: 'Peso',
                        hintText: 'Digite seu peso',
                      ),
                       keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              actions: <Widget> [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fecha o modal
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    // Coleta os dados inseridos
                    String idade = _idadeController.text;
                    String altura = _alturaController.text;
                    String peso = _pesoController.text;

                    if (idade.isEmpty || altura.isEmpty || peso.isEmpty) {
                      return;
                    }

                    setState(() {
                      calculadoraImc.add(new CalculadoraImcModel(int.parse(idade), double.parse(altura), double.parse(peso)));
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text('Salvar IMC'),
                ),
              ]
            );
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
