

class CalculadoraImcModel {
  CalculadoraImcModel(this.idade, this.altura, this.peso);
  int idade;
  double altura;
  double peso;

  String getIMC() {
    
    double imc = this.peso / (this.altura*2); 

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