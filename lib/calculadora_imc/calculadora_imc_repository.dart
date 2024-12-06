import 'calculadora_imc_model.dart';

class CalculadoraImcRepository {

  List<CalculadoraImcModel> listCalculoImc = [];

  void adicionarCalculoImc(CalculadoraImcModel calculo) {
    listCalculoImc.add(calculo);
  }

  List<CalculadoraImcModel> getCalculosImc() {
    return listCalculoImc;
  }

}