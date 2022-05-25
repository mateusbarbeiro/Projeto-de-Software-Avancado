import 'package:exemplo/aula06/aprovacao_nota.dart';
import 'package:test/test.dart';

main() {
  group('calculo média', () {
    test('de notas maiores que a média', () {
      expect(calcularMedia(nota1: 6, nota2: 8), 7);
    });

    test('de notas menores que a média', () {
      expect(calcularMedia(nota1: 5, nota2: 4), 4.5);
    });

    test('de notas menores que a média', () {
      expect(() => calcularMedia(nota1: -5, nota2: 4), throwsException);
    });
  });

  group('calculo maior nota', () {
    test('primeiro parâmetro é o maior', () {
      expect(calcularMaiorNota(5, 2), 5);
    });

    test('segundo parâmetro é o maior', () {
      expect(calcularMaiorNota(3, 7), 7);
    });
  });

  group('calculo menor nota', () {
    test('primeiro parâmetro é o menor', () {
      expect(calcularMenorNota(2, 5), 2);
    });

    test('segundo parâmetro é o menor', () {
      expect(calcularMenorNota(7, 5), 5);
    });
  });

  // group('verifica aprovação', () {
  //   test('', () {
  //     expect(verificarAprovacao(nota1: 5 nota2: 2, caclularNota: c), );
  //   });

  //   test('segundo parâmetro é o menor', () {
  //     expect(calcularMenorNota(7, 5), 5);
  //   });
  // });
}
