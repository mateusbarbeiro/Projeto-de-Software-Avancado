// 27/04/2022 conceito A

// Atividade III → Realize as atividades abaixo
/*
Exercício 01 - implemente as funções
*/

import 'dart:io';

main() {
  // // valida se par
  // solicitarNumeroEValidar(validarSePar);
  // // valida se maior que zero
  // solicitarNumeroEValidar(validarSeMaiorQueZero);
  // // valida se primo
  // solicitarNumeroEValidar(validarSePrimo);

  solicitarDataInicialECalcula(calcularQuantidadeAnos);
  solicitarDataInicialECalcula(calcularQuantidadeDias);
  solicitarDataInicialECalcula(calcularQuantidadeHoras);
}

void solicitarNumeroEValidar(Function(int id) validacao) {
  var id = int.parse(stdin.readLineSync()!);
  print(validacao(id) ? "Valido" : "Invalido");
}

// a) Função que solicite um número e realizar validações: (1) se é par; (2) maior que zero; (3) se é um número primo.
// função "hospedeira" : solicitar um número
bool validarSePar(int numero) {
  return numero % 2 == 0;
}

bool validarSeMaiorQueZero(int numero) {
  return numero > 0;
}

bool validarSePrimo(int numero) {
  int fatores = 0;
  for (int i = 1; i <= numero; i++) {
    if (numero % i == 0) {
      fatores++;
    }
  }
  return fatores <= 2 ? true : false;
}

// b) Função que solicite a data inicial e retorne quanto tempo passou em: (1) anos; (2) dias; e (3) horas.
void solicitarDataInicialECalcula(Function(DateTime data) calcula) {
  // int dia = int.parse(stdin.readLineSync()!);
  // int mes = int.parse(stdin.readLineSync()!);
  // int ano = int.parse(stdin.readLineSync()!);
  int dia = 27;
  int mes = 04;
  int ano = 2021;
  print(calcula(DateTime.utc(ano, mes, dia)));
}

String calcularQuantidadeAnos(DateTime data) {
  DateTime hoje = DateTime.now();
  return (hoje.difference(data).inDays / 365).toString();
}

String calcularQuantidadeDias(DateTime data) {
  DateTime hoje = DateTime.now();
  return (hoje.difference(data).inDays).toString();
}

String calcularQuantidadeHoras(DateTime data) {
  DateTime hoje = DateTime.now();
  return (hoje.difference(data).inHours).toString();
}

// c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
// Exercício 02 - para cada função "hospedeira", defina uma função anônima.
void solicitarQuantidadeDias(Function calculo) {
  int quantidadeDias = int.parse(stdin.readLineSync()!);
  double valorPorHora = double.parse(stdin.readLineSync()!);
  print(calculo(quantidadeDias, valorPorHora));
}

String calcularAuxiliar(int quantidadeDias, double valorPorHora) {
  var salario = quantidadeDias * valorPorHora;
  var desconto = salario * 0.3;
  return (salario - desconto).toString();
}

String calcularJunior(int quantidadeDias, double valorPorHora) {
  var salario = quantidadeDias * valorPorHora;
  var desconto = salario * 0.3;
  var bonus = 100;
  return (salario - desconto + bonus).toString();
}

String calcularPleno(int quantidadeDias, double valorPorHora) {
  var salario = quantidadeDias * valorPorHora;
  var desconto = salario * 0.5;
  var bonus = 150;
  return (salario - desconto + bonus).toString();
}
