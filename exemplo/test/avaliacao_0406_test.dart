import 'package:exemplo/projeto_pessoal/avaliacao0406.dart';
import 'package:exemplo/projeto_pessoal/classes.dart';
import 'package:exemplo/projeto_pessoal/enums.dart';
import 'package:test/test.dart';

Produto y = Produto(
  gtin: '7896587320777',
  categoria: Categoria.lubrificantes,
  nome: 'Óleo',
  quantidadeEmEstoque: 5,
  preco: 0.0,
);

main() {
  group('Função validaProduto', () {
    test('HappyDay validação quantidade em estoque mínima', () {
      expect(
        validaProduto(
          produto: y,
          validacao: (prod) => prod.quantidadeEmEstoque > 0,
        ),
        y,
      );
    });

    test('Falha validação quantidade em estoque mínima', () {
      expect(
        validaProduto(
          produto: y,
          validacao: (prod) => prod.quantidadeEmEstoque > 6,
        ),
        throwsException,
      );
    });
  });

  group('Função respostaToBoolean', () {
    test('Envia N deve retornar false', () {
      expect(
        respostaToBoolean(resposta: 'N'),
        false,
      );
    });
  });

  test('Envia S deve retornar true', () {
    expect(
      respostaToBoolean(resposta: 'S'),
      true,
    );
  });

  test('Envia nenhum parâmetro deve retornar false', () {
    expect(
      respostaToBoolean(),
      false,
    );
  });
}
