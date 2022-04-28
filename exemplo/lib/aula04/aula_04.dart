void main(List<String> args) {
  print(verificarAprovacao(10, 8));
  print(verificarAprovacao(10, 8, 7));

  // com parâmetros nomeados, não é obrigatório seguir a ordem definido no declaração da função
  verificarAprovacaoNomeado(nota2: 8, nota1: 10);
  verificarAprovacaoNomeado(nota1: 10, nota2: 8, mediaAprovacao: 7);
}

// Parâmetro opcional
String verificarAprovacao(double nota1, double nota2,
    [double mediaAprovacao = 6]) {
  var media = (nota1 + nota2) / 2;
  if (media >= mediaAprovacao) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

String verificarAprovacaoNomeado(
    {required double nota1, required double nota2, double mediaAprovacao = 6}) {
  var media = (nota1 + nota2) / 2;
  if (media >= mediaAprovacao) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}
