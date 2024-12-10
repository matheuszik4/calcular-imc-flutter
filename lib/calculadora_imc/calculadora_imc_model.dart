import 'package:hive/hive.dart';

part 'calculadora_imc_model.g.dart';

@HiveType(typeId: 1)
class CalculadoraImcModel extends HiveObject {

  @HiveField(0)
  int idade = 0;

  @HiveField(1)
  double altura = 0.0;

  @HiveField(2)
  double peso = 0.0;

  String getIMC() {
    
    double imc = peso / (altura*2); 

    if (imc <= 16) {
      return 'Magreza Grave';
    } else if (imc >= 16 && imc <= 17) {
      return 'Magreza Moderada';
    } else if (imc >= 17 && imc <= 18.5) {
      return 'Magreza Leve';
    }  else if (imc >= 18.5 && imc <= 25) {
      return 'Saudável';
    }  else if (imc >= 25 && imc <= 30) {
      return 'Sobrepeso';
    }  else if (imc >= 30 && imc <= 35) {
      return 'Obesidade Grau |';
    } else if (imc >= 35 && imc <= 40) {
      return 'Obesidade Grau || (severa)';
    } else if (imc >= 40) {
      return 'Obesidade Grau ||| (mórbida)';
    }

    return '';
  }

}