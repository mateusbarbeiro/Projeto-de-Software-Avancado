// De acordo com o Domínio de Negócio/Escopo do seu projeto (tem que ser único
//- diferente dos colegas e do exemplo de aula),

import 'package:exemplo/projeto_pessoal/classes.dart';
import 'package:exemplo/projeto_pessoal/enums.dart';

///
///     um sistema de gerenciamento de estoque para lojas de pequeno ou médio porte
///     no setor de autopeças, também gerenciando as entradas e saídas de mercadorias
///

// elaborar 10 funções correlatas que tratem regras de negócio ou que de suporte
// a requisitos do projeto. As funções elaboradas deverá possuir:

//    (i)   anonymous function e/ou arrow function (pelo menos 2 exemplos);

Produto y = Produto(
  gtin: '7896587320777',
  categoria: Categoria.lubrificantes,
  nome: 'Óleo',
  quantidadeEmEstoque: 5,
  preco: 0.0,
);

var x = calculaParcelamento(
  numeroParcelas: 5,
  valorTotal: 100,
  calcularParcela: (total, numeroParcela) => total / numeroParcela,
);

var a = calculaParcelamento(
  numeroParcelas: 5,
  valorTotal: 100,
  calcularParcela: (total, numeroParcela) => (total / numeroParcela) + 10,
);

// 01
// arrow function que verifica se quantidade em estoque é valida
var m = validaProduto(
  produto: y,
  validacao: (prod) => prod.quantidadeEmEstoque > 0,
);

// 02
// recebe função nomeada
var z = validaProduto(
  produto: y,
  validacao: validaCodigoBarras,
);

// função auxiliar para validar código de barras
bool validaCodigoBarras(Produto produto) {
  if (produto.gtin.length != 13) {
    return false;
  }
  return double.tryParse(produto.gtin) != null;
}

//    (ii)  parâmetros posicionais obrigatórios e opcionais;

// 03
// função que recebe lista e adiciona produto com informações padrão para
// quantidade e prioridade
List<Selecionado> adicionaProdutoItemSelecionado(
  List<Selecionado> selecionados,
  Produto produto, [
  int quantidade = 1,
  int prioridade = 1,
]) {
  selecionados.add(Selecionado(
    quantidade: 1,
    prioridade: 1,
    produto: produto,
    date: DateTime.now(),
  ));

  return selecionados;
}

// 04
// função que recebe lista selecionados e cria entrada com informações padrão
// para seu status
EntradaProduto criaEntradaProduto(
  List<Selecionado> selecionados, [
  StatusEntrada statusEntrada = StatusEntrada.aberta,
]) {
  var entrada = EntradaProduto(
    date: DateTime.now(),
    selecionados: selecionados,
    status: statusEntrada,
  );

  return entrada;
}

// 05
// função que recebe lista selecionados e cria saída com informações padrão
// para seu status, tipo de saída e meio de pagamento
VendaProduto criaVendaProduto(
  List<Selecionado> selecionados,
  TipoPagamento formaPagamento,
  Produto produto, [
  StatusSaida statusSaida = StatusSaida.aberta,
  TipoSaida tipoSaida = TipoSaida.venda,
]) {
  var entrada = VendaProduto(
    date: DateTime.now(),
    selecionados: selecionados,
    status: statusSaida,
    pagamento: formaPagamento,
  );

  return entrada;
}

// 06
// função que recebe uma saida, calcula valor total e aplica desconto dado tipo de
// pagamento e se informado pelo parâmetro desconto, que é posicional e opcional.
double aplicaDescontoVenda(
  VendaProduto saidaProduto, [
  double desconto = 0,
]) {
  double total = calculaPrecoTotalProdutosSelecionados(
    saidaProduto.selecionados,
  );

  double descontoMeioPagamento = calculaDescontoDadoFormaPagamento(
    saidaProduto.pagamento,
    total,
  );

  double precoFinal = total - desconto - descontoMeioPagamento;
  return precoFinal;
}

// função auxiliar para calcular valor total da lista de produtos selecionados
double calculaPrecoTotalProdutosSelecionados(
  List<Selecionado> produtosSelecionados,
) {
  double total = 0.0;
  for (var selecionado in produtosSelecionados) {
    total += selecionado.produto.preco * selecionado.quantidade;
  }

  return total;
}

// função auxiliar para calcular desconto do meio de pagamento
double calculaDescontoDadoFormaPagamento(
  TipoPagamento meioPagamento,
  double total,
) {
  if (meioPagamento == TipoPagamento.dinheiro) {
    return total * 0.10;
  } else if (meioPagamento == TipoPagamento.pix) {
    return total * 0.15;
  } else if (meioPagamento == TipoPagamento.debito) {
    return total * 0.05;
  } else if (meioPagamento == TipoPagamento.credito) {
    return total * 0.03;
  }

  return 0.0;
}

// 07
// função que recebe uma entrada, calcula valor total e aplica desconto dado
// parâmetro desconto, que é posicional e opcional.
double aplicaDescontoEntradaProduto(
  EntradaProduto entrada, [
  double desconto = 0,
]) {
  double total = calculaPrecoTotalProdutosSelecionados(entrada.selecionados);

  return total - desconto;
}

//    (iii) parâmetros nomeados obrigatórios e opcionais; e

// 08
// função com parâmetros nomeados obrigatórios responsável por validar
// um produto
Produto validaProduto({
  required Produto produto,
  required Function(Produto) validacao,
}) {
  if (!validacao(produto)) {
    throw Exception("Produto Inválido.");
  }

  return produto;
}

// 09
// função com parâmetro nomeado opcional responsavel por converter resposta
// para boolean. Tem como parâmetro default "N"
bool respostaToBoolean({String resposta = "N"}) {
  if (resposta == "N") {
    return false;
  } else if (resposta == "S") {
    return true;
  } else {
    return false;
  }
}

// 10
// função com parâmetro nomeado opcional e obrigatório responsavel por
// alterar prioridade de um item selecionado. Tem como parâmetro opcional
// prioridade como 1
Selecionado alteraPrioridade({
  required Selecionado selecionado,
  int prioridade = 1,
}) {
  selecionado.prioridade = prioridade;
  return selecionado;
}

// função para calcular parcelamento
Map<String, double> calculaParcelamento({
  required int numeroParcelas,
  required double valorTotal,
  required double Function(double, int) calcularParcela,
}) {
  Map<String, double> parcelas = {};

  for (var i = 1; i <= numeroParcelas; i++) {
    double valor = calcularParcela(valorTotal, numeroParcelas);

    parcelas.addAll({
      'parcela$i': valor,
    });
  }

  return parcelas;
}


//    (iv)  testes unitários.
// contida no arquivo lib\projeto_pessoal\avaliacao0406.dart

// Como é avaliação, pode-se inserir comentários para explicar/justificar a
// solução/implementação. Caso não tenha, irei interpretar conforme apresentado.

// Critérios de Avaliação: (Tudo que estudamos durante o período)

// Alinhamento com o escopo/domínio;
// Complexidade e/ou relevância da função;
// Baixo acoplamento (capacidade de reuso) e coesão das definições;
// Coesão e coerência na sintaxe e semântica;
// Legibilidade do código, nomenclatura sugestivas das funções, variáveis e parâmetros;
// Uso correto e adequado do tratamento de erros e validações.
