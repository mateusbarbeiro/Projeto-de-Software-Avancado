void show() {
  print("Arquivo FUNÇÕES COM RETORNO e COM PARÂMETROS.");
  // // grau de liberdade: ++++ | grande
  // // não possui parte da interface (impressão do resulto) no bloco de instruções.
  // print(verificarAprovacao(6, 10));

  // chama funcao que recebe salario e desconto por parametro e retorna string do resultado que é exibido pelo print
  //  caso salario seja maior que desconto, retorna "saldo: x" sendo x o resultado da subtração salario - desconto, ou,
  //  caso salario seja menor que desconto, retorna "Saldo Insuficiente"
  print(calcularSalario(1000, 100));
  print(calcularSalario(10, 100));
}

// ENTRADAS: salario, desconto (recebidos pelo parametro)
// RESULTADO ESPERADO: se saldo suficiente, retorna resultado da subtração salario - desconto, caso não, retorna "Saldo Insuficiente"
// calularSalario
String calcularSalario(double salario, double desconto) {
  // verifica se há saldo suficiente
  if (salario > desconto) {
    // imprime saldo, calcula saldo já dentro da interpolação
    return ("Saldo: ${salario - desconto}");
  } else {
    return ("Saldo Insuficiente");
  }
}

// atividade exemplo
String verificarAprovacao(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;
  return media >= 6 ? 'Aprovado' : 'Reprovado';
}
