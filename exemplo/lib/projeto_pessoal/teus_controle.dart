import 'dart:io';

List<Produto> produtos2 = [
  Produto('Oleo', 10.0),
  Produto('Filtro de ar', 25.0),
  Produto('Amortecedor', 150.5),
];

List<Produto> produtosSelecionados2 = [];

// função sem retorno e sem parâmetro
void menu() {
  while (true) {
    // lista produtos selecionados
    if (produtosSelecionados2.isNotEmpty) {
      exibeSelecionados();
    } else {
      print("Não há produtos selecionados");
    }

    print("""
\nOperações
1 - adicionar produto
2 - remover produto
3 - finalizar e listar produtos

Digite a operação: """);

    var operacao = int.parse(stdin.readLineSync()!);
    if (operacao == 3) {
      exibeSelecionados();
      break;
    }

    selecionarOperacao(operacao);
  }
}

// função sem retorno e com paramentro
void selecionarOperacao(int operacao) {
  switch (operacao) {
    case 1:
      produtosSelecionados2.add(selecionarProduto());
      break;
    case 2:
      print("Selecione um produto: ");
      var id = int.parse(stdin.readLineSync()!) - 1;
      produtosSelecionados2.remove(selecionarDosProdutosSelecionados(id));
      break;
  }
}

// função com retorno e sem paramentro
Produto selecionarProduto() {
  int count = 1;
  print("\nLista de PRODUTOS");
  for (var e in produtos2) {
    print("$count - ${e.nome}");
    count++;
  }

  print("Selecione um produto: ");
  var id = int.parse(stdin.readLineSync()!) - 1;

  return produtos2[id];
}

// função com retorno e com parâmetro
Produto selecionarDosProdutosSelecionados(int id) {
  return produtosSelecionados2[id];
}

void exibeSelecionados() {
  print("\nProdutos SELECIONADOS: ");
  int count = 1;
  for (var item in produtosSelecionados2) {
    print("$count - ${item.nome}");
    count++;
  }
}

class Produto {
  String nome;
  double valor;

  Produto(this.nome, this.valor);
}
