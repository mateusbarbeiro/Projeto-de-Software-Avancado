// 27/04/2022 conceito C
// 04/04/2022 conceito A
import 'dart:io';

List<Produto> produtosCatalogo = [
  Produto(nome: 'Feijão', categoria: Categoria.alimenticios),
  Produto(nome: 'Smartphone', categoria: Categoria.eletronicos),
  Produto(nome: 'Coca-Cola', categoria: Categoria.bebidas),
  Produto(nome: 'Game', categoria: Categoria.digitais),
];

List<Selecionado> produtosSelecionados = [];

// função sem retorno e sem parâmetro
void menu() {
  while (true) {
    if (produtosSelecionados.isNotEmpty) {
      exibeSelecionados();
    }

    exibeOpcoes();

    var operacao = int.parse(stdin.readLineSync()!);
    if (operacao == 4) {
      exibeSelecionados();
      break;
    }

    try {
      switch (operacao) {
        case 1:
          operacaoUm();
          break;
        case 2:
          operacaoDois();
          break;
        case 3:
          operacaoTres();
          break;
        default:
          throw InvalidInput("Opção invalida");
      }
    } on NotFound catch (e) {
      print(e.cause);
    } on InvalidInput catch (e) {
      print(e.cause);
    } catch (e) {
      print(e.toString());
    }
  }
}

// função com parâmetro e sem retorno
void insereProdutoNaLista(Produto produto) {
  try {
    var selecionado = buscaSelecionadoDadoProduto(produto);
    print("Deseja informar quantidade [S/N] ");
    String resposta = stdin.readLineSync()!.toUpperCase();
    if (resposta == 'S') {
      print("Quantidade: ");
      int quantidade = int.parse(stdin.readLineSync()!);
      incrementaQuantidadeSelecionado(selecionado, quantidade: quantidade);
      return;
    } else if (resposta == "N") {
    } else {
      throw InvalidInput("Valor informado invalido");
    }

    if (hasProdutoNaLista(produto)) {
      incrementaQuantidadeSelecionado(selecionado);
    } else {
      produtosSelecionados.add(Selecionado(produto: produto));
    }
  } catch (e) {
    rethrow;
  }
}

bool hasProdutoNaLista(Produto produto) {
  return produtosSelecionados.any((element) => element.produto == produto);
}

void decrementaQuantidadeSelecionado(Selecionado selecionado) {
  selecionado.quantidade--;
}

Selecionado buscaSelecionadoDadoProduto(Produto produto) {
  return produtosSelecionados
      .firstWhere((element) => element.produto == produto);
}

// função com parâmetro e sem retorno
void removerProdutoDaLista(Produto produto) {
  print("Tem certeza que deseja remover: [S/N]");
  String? resposta = stdin.readLineSync();
  // confirmaRemocao(resposta: resposta);

  Selecionado selecionado = buscaSelecionadoDadoProduto(produto);
  if (selecionado.quantidade > 1) {
    decrementaQuantidadeSelecionado(selecionado);
  } else {
    produtosSelecionados.remove(selecionado);
  }
}

// função sem retorno e sem parâmetro
void exibeProdutosCatalogo() {
  int count = 1;
  print("\nProdutos do CATALOGO");
  for (var e in produtosCatalogo) {
    print("$count - ${e.nome}");
    count++;
  }
}

// função sem retorno e sem parâmetro
void exibeSelecionados() {
  int count = 1;
  print("\nProdutos SELECIONADOS: ");
  print("\n[id]   [descrição]   [quantidade]");
  for (var item in produtosSelecionados) {
    print("$count     -     ${item.produto.nome}     -     ${item.quantidade}");
    count++;
  }
}

// função se retorno e sem parâmetro
void exibeOpcoes() {
  print("""

Operações
1 - Selecionar um produto
2 - Remover um produto selecionados
3 - Definir prioridade para selecionados
4 - Finalizar 

Digite a operação: """);
}

// função se retorno e sem parâmetros
void operacaoUm() {
  exibeProdutosCatalogo();
  var produto = solicitaProduto();

  if (produto == null) {
    throw NotFound("Produto não encontrado.");
  }

  insereProdutoNaLista(produto);
  // manipularProdutosSelecionados(
  //     exibeProdutos, (id) => produtosSelecionados.add(produtosCatalogo[id]));
}

// função se retorno e sem parâmetro
void operacaoDois() {
  exibeSelecionados();
  var produto = solicitaProduto(TipoListas.selecionados);

  if (produto == null) {
    throw NotFound("Produto não encontrado.");
  }

  removerProdutoDaLista(produto);
}

// função se retorno e sem parâmetro
void operacaoTres() {
  // função se retorno e sem parâmetro
  // produto obrigatorio
}

//    DEPRECATED FUNCTIONS
// função com retorno e sem paramentro
Produto selecionarProduto() {
  try {
    int count = 1;
    print("\nLista de PRODUTOS");
    for (var e in produtosCatalogo) {
      print("$count - ${e.nome}");
      count++;
    }

    print("Selecione um produto: ");
    var id = int.parse(stdin.readLineSync()!) - 1;

    return produtosCatalogo[id];
  } catch (e) {
    rethrow;
  }
}

// função com retorno e com parâmetro
Produto selecionarDosProdutosSelecionados(int id) {
  return produtosSelecionados[id].produto;
}

// função sem retorno e sem parâmetros
// String calcularValorTotal({
//   required bool Function(double valor, Categoria categoria) possuiPromocao,
//   required int porcentagemDesconto,
// }) {
//   var total = 0.0;
//   for (var item in produtosSelecionados) {
//     var desconto = 0.0;
//     if (possuiPromocao(total, item.categoria)) {
//       desconto = item.valor * (porcentagemDesconto / 100);
//     }
//     total += (item.valor - desconto);
//   }
//   return total.toString();
// }
//    FIM DEPRECATED FUNCTIONS

//    CLASSES
class Produto {
  String nome;
  Categoria categoria;

  // parâmetros do construtor nomeados e obrigatórios
  Produto({
    required this.nome,
    required this.categoria,
  });
}

class Selecionado {
  Produto produto;
  int quantidade;
  int prioridade;

  // parâmetros do construtor nomeados
  // Um parâmetro obrigatório
  // Um parâmetro padrão
  Selecionado({
    required this.produto,
    this.quantidade = 1,
    this.prioridade = 1,
  });
}

//    FIM CLASSES

//    ENUMS
enum Categoria {
  alimenticios,
  eletronicos,
  digitais,
  bebidas,
}

enum TipoListas {
  catalogo,
  selecionados,
}
//    FIM ENUMS

// função com retorno e com parâmetro
// 5 - função com parâmetros posicionais opcionais (valor padrão)
Produto? solicitaProduto([TipoListas lista = TipoListas.catalogo]) {
  try {
    var id = int.parse(stdin.readLineSync()!) - 1;

    if (lista == TipoListas.catalogo) {
      return produtosCatalogo[id];
    } else if (lista == TipoListas.selecionados) {
      return produtosSelecionados[id].produto;
    }
    return null;
  } catch (e) {
    rethrow;
  }
}

// função sem retorno e com paramentro
// 6 -função com parâmetros nomeados obrigatórios;
void manipularProdutosSelecionados({
  required Function exibeProdutos,
  required Function manipularLista,
}) {
  try {
    exibeProdutos();
    print("Selecione um produto: ");
    var id = int.parse(stdin.readLineSync()!) - 1;

    manipularLista(id);
  } catch (e) {
    rethrow;
  }
}

// 7 -função com parâmetros nomeados opcionais;
bool deveRemover({String resposta = "N"}) {
  if (resposta == "N") {
    return false;
  } else if (resposta == "S") {
    return true;
  } else {
    return false;
  }
}

// 8 - função com parâmetros nomeados obrigatórios e opcionais;
void alteraPrioridade({required Selecionado selecionado, int prioridade = 1}) {
  selecionado.prioridade = prioridade;
}

// 9 - função com parâmetros nomeados e posicionais
void incrementaQuantidadeSelecionado(
  Selecionado selecionado, {
  int quantidade = 1,
}) {
  selecionado.quantidade += quantidade;
}

class NotFound implements Exception {
  String cause;
  NotFound(this.cause);
}

class InvalidInput implements Exception {
  String cause;
  InvalidInput(this.cause);
}
