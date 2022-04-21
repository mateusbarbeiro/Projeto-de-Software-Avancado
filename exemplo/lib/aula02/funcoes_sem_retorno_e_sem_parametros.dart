import 'dart:io';

void show() {
  print("Arquivo FUNÇÕES SEM RETORNO e SEM PARÂMETROS.");
  // // grau de liberdade: + | baixo
  // // possui partes da interface (solicitação de entrada de dados) no bloco de instruções.
  // verificarAprovacao();

  // // chama funcao que solicita salario e desconto e exibe
  // //  caso salario seja maior que desconto, "saldo: x" sendo x o resultado de salario - desconto se , ou,
  // //  caso salario seja menor que desconto, exibe "Saldo Insuficiente"
  // calcularSalario();
}

// ENTRADAS: salario, desconto (solicitado no terminal)
// RESULTADO ESPERADO: se saldo suficiente, exibe, caso não, exibe "Saldo Insuficiente" (exibe no terminal)
// calularSalario
void calcularSalario() {
  print('Salario: ');
  // solicita valor salario
  var salario = double.parse(
      stdin.readLineSync()!); // assume o risco de ser passado um valor nullo

  print('Desconto: ');
  // solicita valor desconto
  var desconto = double.parse(
      stdin.readLineSync()!); // assume o risco de ser passado um valor nullo

  // verifica se há saldo suficiente
  if (salario > desconto) {
    // imprime saldo, calcula saldo já dentro da interpolação
    print("Saldo: ${salario - desconto}");
  } else {
    print("Saldo Insuficiente");
  }
}

// atividade exemplo
void verificarAprovacao() {
  print('Nota 1: ');
  var entrada = stdin.readLineSync();
  var nota1 = 0.0;

  if (entrada != null) {
    nota1 = double.parse(entrada);
  }

  print('Nota 2: ');
  var nota2 = double.parse(
      stdin.readLineSync()!); // assume o risco de ser passado um valor nullo

  var media = (nota1 + nota2) / 2;

  // if (media >= 6) {
  //   print('Aprovado');
  // } else {
  //   print('Reprovado');
  // }

  print(media >= 6 ? 'Aprovado' : 'Reprovado'); // operador ternario
}
