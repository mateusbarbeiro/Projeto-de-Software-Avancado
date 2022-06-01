import 'dart:math';

import 'package:exemplo/projeto_pessoal/avaliacao0406.dart';
import 'package:exemplo/projeto_pessoal/classes.dart';
import 'package:exemplo/projeto_pessoal/enums.dart';
import 'package:test/test.dart';

Produto y = Produto(
  gtin: '7896587320777',
  categoria: Categoria.lubrificantes,
  nome: 'Óleo',
  quantidadeEmEstoque: 5,
  preco: 10.0,
);

main() {
  group('Função calculaParcelamento', () {
    test(
      "calcula parcelamento de valor total em 5 vezes com função anônima",
      (() {
        expect(
            calculaParcelamento(
                numeroParcelas: 5,
                valorTotal: 100,
                calcularParcela: (total, numeroParcela) {
                  double valor = total / numeroParcela;
                  return valor;
                }),
            {
              'parcela1': 20.0,
              'parcela2': 20.0,
              'parcela3': 20.0,
              'parcela4': 20.0,
              'parcela5': 20.0
            });
      }),
    );

    test(
      "calcula parcelamento de valor total em 5 vezes com arrow function",
      (() {
        expect(
            calculaParcelamento(
              numeroParcelas: 5,
              valorTotal: 100,
              calcularParcela: (total, numeroParcela) => total / numeroParcela,
            ),
            {
              'parcela1': 20.0,
              'parcela2': 20.0,
              'parcela3': 20.0,
              'parcela4': 20.0,
              'parcela5': 20.0
            });
      }),
    );
  });

  group('Função respostaToBoolean', () {
    test('Envia N deve retornar false', () {
      expect(
        respostaToBoolean(resposta: 'N'),
        false,
      );
    });

    test('Envia S deve retornar true', () {
      expect(
        respostaToBoolean(resposta: 'S'),
        true,
      );
    });

    test('Envia qualquer coisa por parâmetro deve lançar exceção', () {
      expect(
        () => respostaToBoolean(resposta: 'asd'),
        throwsException,
      );
    });
  });

  group('Função aplicaDescontoVenda', () {
    test(
      'Calcula desconto de 15% para pix e aplica mais 5 de desconto',
      () {
        expect(
          aplicaDescontoVenda(
            VendaProduto(
              selecionados: [
                Selecionado(produto: y, date: DateTime.now(), quantidade: 5)
              ],
              date: DateTime.now(),
              status: StatusSaida.fechada,
              pagamento: TipoPagamento.pix,
            ),
            5,
          ),
          37.5,
        );
      },
    );

    test(
      'Calcula desconto de 10% para dinheiro e aplica mais 5 de desconto',
      () {
        expect(
          aplicaDescontoVenda(
            VendaProduto(
              selecionados: [
                Selecionado(produto: y, date: DateTime.now(), quantidade: 5)
              ],
              date: DateTime.now(),
              status: StatusSaida.fechada,
              pagamento: TipoPagamento.pix,
            ),
            5,
          ),
          40.0,
        );
      },
    );

    test(
      'Calcula desconto de 5% para débito e aplica mais 5 de desconto',
      () {
        expect(
          aplicaDescontoVenda(
            VendaProduto(
              selecionados: [
                Selecionado(produto: y, date: DateTime.now(), quantidade: 5)
              ],
              date: DateTime.now(),
              status: StatusSaida.fechada,
              pagamento: TipoPagamento.debito,
            ),
            5,
          ),
          42.5,
        );
      },
    );

    test(
      'Calcula desconto de 3% para crédito e aplica mais 5 de desconto',
      () {
        expect(
          aplicaDescontoVenda(
            VendaProduto(
              selecionados: [
                Selecionado(produto: y, date: DateTime.now(), quantidade: 5)
              ],
              date: DateTime.now(),
              status: StatusSaida.fechada,
              pagamento: TipoPagamento.credito,
            ),
            5,
          ),
          43.5,
        );
      },
    );
    test(
      'Tenta calcular desconto para venda ainda em aberto',
      () {
        expect(
          () => aplicaDescontoVenda(
            VendaProduto(
              selecionados: [
                Selecionado(produto: y, date: DateTime.now(), quantidade: 5)
              ],
              date: DateTime.now(),
              status: StatusSaida.aberta,
              pagamento: TipoPagamento.credito,
            ),
            5,
          ),
          throwsException,
        );
      },
    );
  });

  group('Função calculaDescontoDadoFormaPagamento', () {
    test('Calcula desconto 10% em total quando dinheiro', () {
      expect(
        calculaDescontoDadoFormaPagamento(
          meioPagamento: TipoPagamento.dinheiro,
          total: 100,
        ),
        10,
      );
    });

    test('Calcula desconto 15% em total quando pix', () {
      expect(
        calculaDescontoDadoFormaPagamento(
          meioPagamento: TipoPagamento.pix,
          total: 100,
        ),
        15,
      );
    });

    test('Calcula desconto 5% em total quando debito', () {
      expect(
        calculaDescontoDadoFormaPagamento(
          meioPagamento: TipoPagamento.debito,
          total: 100,
        ),
        5,
      );
    });

    test('Calcula desconto 3% em total quando credito', () {
      expect(
        calculaDescontoDadoFormaPagamento(
          meioPagamento: TipoPagamento.credito,
          total: 100,
        ),
        3,
      );
    });
  });

  group('Função aplicaDescontoEntradaProduto', () {
    test('aplica desconto de 5 em entrada de produto', () {
      expect(
        aplicaDescontoEntradaProduto(
            EntradaProduto(
              selecionados: [
                Selecionado(produto: y, date: DateTime.now(), quantidade: 5)
              ],
              date: DateTime.now(),
              status: StatusEntrada.fechada,
            ),
            5),
        45,
      );
    });

    test('tenta aplicar desconto de 5 em entrada de produto aberta', () {
      expect(
        () => aplicaDescontoEntradaProduto(
            EntradaProduto(
              selecionados: [
                Selecionado(produto: y, date: DateTime.now(), quantidade: 5)
              ],
              date: DateTime.now(),
              status: StatusEntrada.aberta,
            ),
            5),
        throwsException,
      );
    });
  });

  group('Função calculaPrecoTotalProdutosSelecionados', () {
    test('calcula total selecionados', () {
      expect(
        calculaPrecoTotalProdutosSelecionados(
          [
            Selecionado(
              produto: y,
              date: DateTime.now(),
              quantidade: 5,
            ),
          ],
        ),
        50,
      );
    });
  });
}
