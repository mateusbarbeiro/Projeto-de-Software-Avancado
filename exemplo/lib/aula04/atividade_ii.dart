void main() {
  var salario = 100.0;
  var valor = 10.0;
  //Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.
  adicionarSalario(salario, valor, ePositivo);

  //Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.
  adicionarSalario(salario, valor, (val) {
    return val > 0;
  });

  //Exercício 3  - refaça o exe anterior, utilizando a arrow function.
  adicionarSalario(salario, valor, (val) => val > 0);

  //Exercício 4  - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.
  // não é possível chamar função nomeada para verificar se o valor é menor do que o salário
  // pois adicionarSalario() recebe uma função para validação que tem um único parâmetro,
  // adicionarSalario(salario, 10, eMenorQueSalario);
  adicionarSalario(salario, valor, (val) {
    return val < 100;
  });
  adicionarSalario(salario, valor, (val) => val < salario);

  //Exercício 5  - refaça o exe c porém fazendo uma validação sua.
  adicionarSalario(salario, valor, (val) => val != 0 && val < salario);

  //Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.
  List<double> valores = [10, 20, 30];
  // primeiro exemplo de função anônima da biblioteca do dart
  // função forEach realiza uma iteração na lista e realiza o a função anonima que recebe por parâmetro
  valores.forEach((element) {
    print("$element é ${element % 2 == 0 ? "é par" : "é impar"}");
  });

  // segundo exemplo de função anônima da biblioteca do dart
  // função map realiza uma iteração na lista e realiza o a função anonima que recebe por parâmetro,
  // retornando uma nova lista que neste exemplo se trata de uma lista com cada valor da lista "valores" multiplicado por 2
  List<double> valoresVezes2 = valores.map((e) => e * 2).toList();
  valoresVezes2.forEach((element) {
    print(element);
  });

  /*
  Exercício 6 - Conseguiu entender:
    - O contexto em que é útil utilizar funções anônimas?
    - Os requisitos necessários para usar funções anônimas? 
    - diferença entre função nomeada e anônimas?
    - diferença entre anonymous function e arrow function?
    Em que caso devemos utilizar Arrow Function? O que devemos considerar?
  */
}

void adicionarSalario(
    double salario, double valor, Function(double valor) validacao) {
  final eValido = validacao(valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  }
}

bool ePositivo(double numero) {
  if (numero > 0) {
    return true;
  } else {
    return false;
  }
}

// bool eMenorQueSalario(double valorComparado) {
//   return salario < valorComparado;
// }

// bool eMenorQue(double valorReferencia, double valorComparado) {
//   return valorReferencia < valorComparado;
// }
