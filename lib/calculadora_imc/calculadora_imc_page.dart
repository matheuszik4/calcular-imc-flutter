
import 'package:flutter/material.dart';
import 'calculadora_imc_model.dart';
import 'calculadora_imc_repository.dart';

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({super.key, required this.title});

  final String title;

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  late CalculadoraImcRepository calculadoraImcRepository;
  List<CalculadoraImcModel> calculadoraImc = [];

  final _idadeController = TextEditingController();
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.getData();
  }

   void getData() async {
    calculadoraImcRepository = await CalculadoraImcRepository.carregar();
    calculadoraImc = calculadoraImcRepository.index();
    setState(() {});
  }


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
            leading: const Icon(Icons.fitness_center), 
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
              title: const Text('Cálculo de IMC'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _idadeController,
                      decoration: const InputDecoration(
                        labelText: 'Idade',
                        hintText: 'Digite sua idade',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: _alturaController,
                      decoration: const InputDecoration(
                        labelText: 'Altura',
                        hintText: 'Digite sua altura',
                      ),
                       keyboardType: TextInputType.number,
                    ),
                                        TextField(
                      controller: _pesoController,
                      decoration: const InputDecoration(
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
                  child: const Text('Cancelar'),
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
                      CalculadoraImcModel imc = new CalculadoraImcModel();
                      imc.idade = int.parse(idade);
                      imc.altura = double.parse(altura);
                      imc.peso = double.parse(peso);
                      calculadoraImc.add(imc);
                      calculadoraImcRepository.create(imc);
                    });

                    Navigator.of(context).pop();
                  },
                  child: const Text('Salvar IMC'),
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
