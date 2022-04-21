import 'dart:io';

void show() {
  print('''OPÇÕES: 
  1 - Bonificar
  2 - Descontar
  3 - Aplicar Bônus
  
  Selecione a opção: 
  ''');

  int opcao = int.parse(stdin.readLineSync()!);
  print('Digite seu salário: ');
  double salario = double.parse(stdin.readLineSync()!);
  print('Digite o valor a ser utilizado: ');
  double valor = double.parse(stdin.readLineSync()!);

  escolherOpcao(opcao, salario, valor);
}

// Atividade II - Defina 3 funções do mesmo contexto
// e uma interface para estas funções
// função escolher funções do salario
void escolherOpcao(int opcao, double salario, double valor) {
  double result = 0.0;

  if (opcao == 1) {
    result = bonificar(salario, valor);
  } else if (opcao == 2) {
    result = descontar(salario, valor);
  } else if (opcao == 3) {
    result = aplicarBonus(salario, valor);
  }

  print(result);
}

// função receber um salario e um valor, bonificar e retornar o valor do salario
double bonificar(double salario, double valor) {
  return salario + valor;
}

// função receber um salario e um valor, descontar e retornar o valor do salario
double descontar(double salario, double valor) {
  return salario - valor;
}

// função receber um salario e um valor, valor é bonus que tem encargos de 10%.
//    adicionar o bonus e retornar o valor do salario
double aplicarBonus(double salario, double valor) {
  double bonusLiquido = valor - (valor * 0.10);
  return salario + bonusLiquido;
}
