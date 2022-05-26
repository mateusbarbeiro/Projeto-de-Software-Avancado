//    CLASSES
import 'package:exemplo/projeto_pessoal/enums.dart';

class Produto {
  String gtin;
  String nome;
  Categoria categoria;
  int quantidadeEmEstoque;
  double preco;

  // parâmetros do construtor nomeados e obrigatórios
  Produto({
    required this.gtin,
    required this.nome,
    required this.categoria,
    required this.quantidadeEmEstoque,
    required this.preco,
  });
}

class Selecionado {
  Produto produto;
  int quantidade;
  int prioridade;
  DateTime date;

  // parâmetros do construtor nomeados
  // Um parâmetro obrigatório
  // Um parâmetro padrão
  Selecionado({
    required this.produto,
    this.quantidade = 1,
    this.prioridade = 1,
    required this.date,
  });
}

class EntradaProduto {
  DateTime date;
  List<Selecionado> selecionados;
  StatusEntrada status;

  EntradaProduto({
    required this.selecionados,
    required this.date,
    required this.status,
  });
}

class VendaProduto {
  DateTime date;
  List<Selecionado> selecionados;
  StatusSaida status;
  TipoPagamento pagamento;

  VendaProduto({
    required this.selecionados,
    required this.date,
    required this.status,
    required this.pagamento,
  });
}

//    FIM CLASSES