
import 'package:hive/hive.dart';
import 'calculadora_imc_model.dart';

class CalculadoraImcRepository {
  static late Box _box;

  CalculadoraImcRepository._criar();

  static Future<CalculadoraImcRepository> carregar() async {
    if (Hive.isBoxOpen('calculadoraImcModel')) {
      _box = Hive.box('calculadoraImcModel');
    } else {
      _box = await Hive.openBox('calculadoraImcModel');
    }
    return CalculadoraImcRepository._criar();
  }

  create(CalculadoraImcModel calculadoraIMcModel) {
    _box.add(calculadoraIMcModel);
  }

  List<CalculadoraImcModel> index() {
    return _box.values.cast<CalculadoraImcModel>().toList();
  }


}