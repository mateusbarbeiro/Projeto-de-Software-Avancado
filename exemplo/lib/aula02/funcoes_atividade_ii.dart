import 'dart:io';

List<String> produtos = ['Oleo', 'Filtro de ar', 'Amortecedor'];
List<String> produtosSelecionados = [];

// função sem retorno e sem parâmetro
void menu() {
  while (true) {
    print("""
      Operações

      1 - adicionar produto
      2 - remover produto
      3 - finalizar e listar produtos
    """);

    var operacao = int.parse(stdin.readLineSync()!);
    if (operacao == 3) {
      break;
    } else {
      selecionarOperacao(operacao);
    }
  }
}

// função sem retorno e com paramentro
void selecionarOperacao(int operacao) {
  switch (operacao) {
    case 1:
      produtosSelecionados.add(selecionarProduto());
      break;
    case 2:
      {
        produtosSelecionados.remove(selecionarDosProdutosSelecionados());
      }
      break;
  }
}

// função com retorno e sem paramentro
String selecionarProduto() {
  int count = 1;
  print("\nLista de PRODUTOS\n");
  for (var e in produtos) {
    print("$count - $e");
  }

  var id = int.parse(stdin.readLineSync()!);

  return produtos[id];
}

String selecionarDosProdutosSelecionados() {
  int count = 1;
  print("\nLista de PRODUTOS\n");
  for (var e in produtos) {
    print("$count - $e");
  }

  var id = int.parse(stdin.readLineSync()!);

  return produtosSelecionados[id];
}

// função com retorno e com parâmetro