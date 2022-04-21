import 'dart:io';

void show() {
  print("Arquivo FUNÇÕES COM RETORNO e SEM PARÂMETROS.");

  // // grau de liberdade: ++ | medio
  // // não possui parte da interface (impressão do resulto) no bloco de instruções.
  // print(verificarAprovacao());

  // chama funcao que solicita salario e desconto e retorna string do resultado que é exibido pelo print
  //  caso salario seja maior que desconto, retorna "saldo: x" sendo x o resultado da subtração salario - desconto, ou,
  //  caso salario seja menor que desconto, retorna "Saldo Insuficiente"
  print(calcularSalario());
}

// ENTRADAS: salario, desconto (solicitado no terminal)
// RESULTADO ESPERADO: se saldo suficiente, retorna resultado da subtração salario - desconto, caso não, retorna "Saldo Insuficiente"
// calularSalario
String calcularSalario() {
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
    return ("Saldo: ${salario - desconto}");
  } else {
    return ("Saldo Insuficiente");
  }
}

// atividade exemplo
String verificarAprovacao() {
  print('Nota 1: ');
  var nota1 = double.parse(
      stdin.readLineSync()!); // assume o risco de ser passado um valor nullo

  print('Nota 2: ');
  var nota2 = double.parse(
      stdin.readLineSync()!); // assume o risco de ser passado um valor nullo

  var media = (nota1 + nota2) / 2;

  return media >= 6 ? 'Aprovado' : 'Reprovado';
}
