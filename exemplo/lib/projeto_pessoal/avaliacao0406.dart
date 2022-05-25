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

// 01
// arrow function que verifica se quantidade em estoque é valida
var x = validaProduto(
  produto: y,
  validacao: (prod) => prod.quantidadeEmEstoque > 0,
);

// 02
// anonymous function que verifica se código de barras do produto é válido
var z = validaProduto(
  produto: y,
  validacao: (prod) {
    if (prod.gtin.length != 13) {
      return false;
    }
    return double.tryParse(prod.gtin) != null;
  },
);

//    (ii)  parâmetros posicionais obrigatórios e opcionais;

// 03
// função que recebe lista e adiciona produto com informações padrão para
// quantidade e prioridade
List<Selecionado> adicionaItemSelecionado(
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
Entrada criaEntrada(
  List<Selecionado> selecionados,
  Produto produto, [
  StatusEntrada statusEntrada = StatusEntrada.aberta,
]) {
  var entrada = Entrada(
    date: DateTime.now(),
    selecionados: selecionados,
    status: statusEntrada,
  );

  return entrada;
}

// 05
// função que recebe lista selecionados e cria saída com informações padrão
// para seu status, tipo de saída e meio de pagamento
Saida criaSaida(
  List<Selecionado> selecionados,
  Produto produto, [
  StatusSaida statusSaida = StatusSaida.aberta,
  TipoSaida tipoSaida = TipoSaida.venda,
  TipoPagamento meioDePagamento = TipoPagamento.nenhum,
]) {
  var entrada = Saida(
    date: DateTime.now(),
    selecionados: selecionados,
    status: statusSaida,
    pagamento: meioDePagamento,
    tipo: tipoSaida,
  );

  return entrada;
}

// 06
// função que recebe uma saida, calcula valor total e aplica desconto dado tipo de
// pagamento e se informado pelo parâmetro desconto, que é posicional e opcional.
double calculaPrecoSaida(
  Saida saida, [
  double desconto = 0,
]) {
  double total = 0.0;
  for (var selecionado in saida.selecionados) {
    total += selecionado.produto.preco * selecionado.quantidade;
  }

  if (saida.tipo == TipoSaida.venda) {
    if (saida.pagamento == TipoPagamento.dinheiro) {
      desconto += total * 0.10;
    } else if (saida.pagamento == TipoPagamento.pix) {
      desconto += total * 0.15;
    } else if (saida.pagamento == TipoPagamento.debito) {
      desconto += total * 0.05;
    } else if (saida.pagamento == TipoPagamento.credito) {
      desconto += total * 0.03;
    }
  }

  return total - desconto;
}

// 07
// função que recebe uma entrada, calcula valor total e aplica desconto dado
// parâmetro desconto, que é posicional e opcional.
double calculaPrecoEntrada(
  Entrada entrada, [
  double desconto = 0,
]) {
  double total = 0.0;
  for (var selecionado in entrada.selecionados) {
    total += selecionado.produto.preco * selecionado.quantidade;
  }

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
    throw Expando("Produto Inválido.");
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

//    (iv)  testes unitários.

// Como é avaliação, pode-se inserir comentários para explicar/justificar a
// solução/implementação. Caso não tenha, irei interpretar conforme apresentado.

// Critérios de Avaliação: (Tudo que estudamos durante o período)

// Alinhamento com o escopo/domínio;
// Complexidade e/ou relevância da função;
// Baixo acoplamento (capacidade de reuso) e coesão das definições;
// Coesão e coerência na sintaxe e semântica;
// Legibilidade do código, nomenclatura sugestivas das funções, variáveis e parâmetros;
// Uso correto e adequado do tratamento de erros e validações.
