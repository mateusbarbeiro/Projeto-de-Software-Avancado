//    CLASSES
import 'dart:io';

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
  Selecionado(
      {required this.produto,
      this.quantidade = 1,
      this.prioridade = 1,
      required this.date});
}

class Entrada {
  DateTime date;
  List<Selecionado> selecionados;
  StatusEntrada status;

  Entrada({
    required this.selecionados,
    required this.date,
    required this.status,
  });
}

class Saida {
  DateTime date;
  List<Selecionado> selecionados;
  StatusSaida status;
  TipoPagamento pagamento;
  TipoSaida tipo;

  Saida({
    required this.selecionados,
    required this.date,
    required this.status,
    required this.pagamento,
    required this.tipo,
  });
}

//    FIM CLASSES