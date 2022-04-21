String verificarAprovacaoCompleto(int opcao, double nota1, double nota2) {
  // Aprovação pela média
  if (opcao == 1) {
    double media = (nota1 + nota2) / 2;

    return media >= 6 ? "Aprovado" : "Reprovado";

    // Aprovação pela maior nota
  } else if (opcao == 2) {
    double maior = nota1;
    if (nota2 > nota1) {
      maior = nota2;
    }
    return maior >= 6 ? "Aprovado" : "Reprovado";

    // Aprovação pela menor nota
  } else {
    double menor = nota1;
    if (nota2 < nota1) {
      menor = nota2;
    }
    return menor >= 6 ? "Aprovado" : "Reprovado";
  }
}

String verificarAprovacaoV2(int opcao, double nota1, double nota2) {
  if (opcao == 1) {
    return verificarPelaMedia(nota1, nota2);
  } else if (opcao == 2) {
    return verificarPelaMaiorNota(nota1, nota2);
  } else if (opcao == 3) {
    return verificarPelaMenorNota(nota1, nota2);
  }
  return "Opção invalida";
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
