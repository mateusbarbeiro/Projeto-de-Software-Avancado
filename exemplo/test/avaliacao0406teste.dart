import 'package:exemplo/projeto_pessoal/avaliacao0406.dart';
import 'package:exemplo/projeto_pessoal/classes.dart';
import 'package:exemplo/projeto_pessoal/enums.dart';
import 'package:test/test.dart';

main() {
  Produto y = Produto(
    gtin: '7896587320777',
    categoria: Categoria.lubrificantes,
    nome: 'Óleo',
    quantidadeEmEstoque: 5,
    preco: 0.0,
  );

  group('Produto', () {
    test('Passa na validação de quantidade em estoque', () {
      expect(
        validaProduto(
          produto: y,
          validacao: (prod) => prod.quantidadeEmEstoque > 0,
        ),
        y,
      );
    });

    // test('Não passa na validação de quantidade em estoque', () {
    //   expect(
    //     validaProduto(
    //       produto: y,
    //       validacao: (prod) => prod.quantidadeEmEstoque > 6,
    //     ),
    //     throwsException,
    //   );
    // });
  });

  group('Resposta para boolean', () {
    test('Envia N', () {
      expect(
        respostaToBoolean(resposta: 'N'),
        false,
      );
    });
  });

  test('Envia S', () {
    expect(
      respostaToBoolean(resposta: 'S'),
      true,
    );
  });

  test('Envia nenhum parâmetro', () {
    expect(
      respostaToBoolean(),
      false,
    );
  });
}
