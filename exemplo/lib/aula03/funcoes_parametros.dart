// objetivo entender parâmetros de funções

void show() {
  // passa função nomeada por parâmetro
  // verificarAprovacao(10, 5, verificarPelaMedia);

  // passa função anônima por parâmetro
  // verificarAprovacao(10, 8, (nota1, nota2) {
  //   double media = (nota1 + nota2) / 2;
  //   if (media >= 6) {
  //     return 'Aprovado';
  //   } else {
  //     return 'Reprovado';
  //   }
  // });

  // passa uma arrow function por parâmetro
  verificarAprovacao(10, 8,
      (nota1, nota2) => ((nota1 + nota2) / 2) ? 'Aprovado' : 'Reprovado');
}

// recebe função por parâmetro
String verificarAprovacao(double nota1, double nota2, Function acao) {
  return acao(nota1, nota2);
}

String verificarPelaMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  return media >= 6 ? "Aprovado" : "Reprovado";
}

String verificarPelaMaiorNota(double nota1, double nota2) {
  double maior = nota1;
  if (nota2 > nota1) {
    maior = nota2;
  }
  return maior >= 6 ? "Aprovado" : "Reprovado";
}

String verificarPelaMenorNota(double nota1, double nota2) {
  double menor = nota1;
  if (nota2 < nota1) {
    menor = nota2;
  }
  return menor >= 6 ? "Aprovado" : "Reprovado";
}
