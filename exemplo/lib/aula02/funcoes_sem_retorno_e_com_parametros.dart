void show() {
  print("Arquivo FUNÇÕES SEM RETORNO e COM PARÂMETROS.");

  // // grau de liberdade: ++ | medio
  // // não possui parte da interface (solicitação de entrada de dados) no bloco de instruções.
  // verificarAprovacao(6, 10);

  calcularSalario(1000, 100); // calcula saldo e exibe "Saldo: 900"
  calcularSalario(100, 8000); // não calcula saldo e exibe "Saldo Insuficiente"
}

// ENTRADAS: salario, desconto (recebidos pelo parametro)
// RESULTADO ESPERADO: se saldo suficiente, exibe, caso não, exibe "Saldo Insuficiente" (exibe no terminal)
// calularSalario
void calcularSalario(double salario, double desconto) {
  // verifica se há saldo suficiente
  if (salario > desconto) {
    // imprime saldo, calcula saldo já dentro da interpolação
    print("Saldo: ${salario - desconto}");
  } else {
    print("Saldo Insuficiente");
  }
}

// atividade exemplo
void verificarAprovacao(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;
  print(media >= 6 ? "Aprovado" : "Reprovado");
}
