// 27/04/2022 conceito C

import 'dart:io';

List<Produto> produtos = [
  Produto('Oleo', 10.0),
  Produto('Filtro de ar', 25.0),
  Produto('Amortecedor', 150.5),
];

List<Produto> produtosSelecionados = [];

// função sem retorno e sem parâmetro
void menu() {
  while (true) {
    // lista produtos selecionados
    if (produtosSelecionados.isNotEmpty) {
      listarProdutosSelecionados();
    } else {
      print("Não há produtos selecionados");
    }

    print("""

Operações
1 - Selecionar um produto
2 - Remover um produto selecionado
3 - Finalizar e listar produtos

Digite a operação: """);

    var operacao = int.parse(stdin.readLineSync()!);
    if (operacao == 3) {
      listarProdutosSelecionados();
      break;
    }

    switch (operacao) {
      case 1:
        manipularProdutosSelecionados(
            listarProdutos, (id) => produtosSelecionados.add(produtos[id]));
        break;
      case 2:
        manipularProdutosSelecionados(listarProdutosSelecionados,
            (id) => produtosSelecionados.remove(produtosSelecionados[id]));
        break;
    }
  }
}

// função sem retorno e com paramentro
void manipularProdutosSelecionados(
    Function listarProdutos, Function manipularLista) {
  listarProdutos();
  print("Selecione um produto: ");
  var id = int.parse(stdin.readLineSync()!) - 1;

  manipularLista(id);
}

void listarProdutos() {
  int count = 1;
  print("\nLista de PRODUTOS");
  for (var e in produtos) {
    print("$count - ${e.nome}");
    count++;
  }
}

void listarProdutosSelecionados() {
  int count = 1;
  print("\nProdutos SELECIONADOS: ");
  for (var item in produtosSelecionados) {
    print("$count - ${item.nome}");
    count++;
  }
}

// função com retorno e sem paramentro
Produto selecionarProduto() {
  int count = 1;
  print("\nLista de PRODUTOS");
  for (var e in produtos) {
    print("$count - ${e.nome}");
    count++;
  }

  print("Selecione um produto: ");
  var id = int.parse(stdin.readLineSync()!) - 1;

  return produtos[id];
}

// função com retorno e com parâmetro
Produto selecionarDosProdutosSelecionados(int id) {
  return produtosSelecionados[id];
}

class Produto {
  String nome;
  double valor;

  Produto(this.nome, this.valor);
}
