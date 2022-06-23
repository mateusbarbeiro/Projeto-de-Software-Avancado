// 2 trimestre

// classes
//semelhante a java
//new é opcional

// sintaxe

import 'package:exemplo/projeto_pessoal/avaliacao0406.dart';

class NomeDaClasse {
  NomeDaClasse() {
    // método construtor da minha classe
    print("Construtor da minha classe");
  }
}

// sintaxe classe privada. É restrita ao arquivo
class _NomeDaClassePrivada {
  _NomeDaClassePrivada() {
    // método construtor da minha classe privada
    print("Construtor da minha classe privada");
  }
}

// definindo atributos para minha classe
class MinhaClasse {
  String? nome;
  int? valor;
}

// definindo atributos para minha classe
class MinhaClasseComAtributosNoConstrutor {
  String? nome;
  int? valor;
  MinhaClasseComAtributosNoConstrutor(String nome, int valor) {
    this.nome = nome;
    this.valor = valor;
  }
}

// definindo atributos para minha classe
class MinhaClasseComAtributosNoConstrutorSimplificado {
  String nome;
  int valor;
  MinhaClasseComAtributosNoConstrutorSimplificado(this.nome, this.valor) {}
}

// definindo atributos para minha classe
class MinhaClasseComAtributosObrigatoriosTardios {
  late String nome;
  late int valor;
  MinhaClasseComAtributosObrigatoriosTardios() {}
}

// definindo atributos para minha classe
class MinhaClasseComGetESet {
  String? _nome;
  // deixam de ser variável, é um valor fixo e o processador consegue otimizar
  final int? valor;

  MinhaClasseComGetESet(this.valor);

  // getter
  String? get nome {
    return _nome;
  }

  // setter
  set nome(String? nome) {
    _nome = nome;
  }
}

class Estado {
  final String nome;
  final String nomeSigla;

  Estado({required this.nome, required this.nomeSigla});
}

class Cidade {
  final String nome;
  final Estado estado;

  Cidade({required this.nome, required this.estado});
}

class Pessoa {
  final String nome;
  final int numero;
  final int anoNascimento;
  final Cidade cidade;

  Pessoa({
    required this.nome,
    required this.numero,
    required this.anoNascimento,
    required this.cidade,
  });
}

class Aluno extends Pessoa {
  final int registroAcademico;
  Aluno({
    required String nome,
    required int numero,
    required int anoNascimento,
    required this.registroAcademico,
    required Cidade cidade,
  }) : super(
          nome: nome,
          numero: numero,
          anoNascimento: anoNascimento,
          cidade: cidade,
        );
}

class Professor extends Pessoa {
  final int siape;
  Professor({
    required String nome,
    required int numero,
    required int anoNascimento,
    required this.siape,
    required Cidade cidade,
  }) : super(
          nome: nome,
          numero: numero,
          anoNascimento: anoNascimento,
          cidade: cidade,
        );
}

class Aluno1 {
  final String nome;
  final int numero;
  Aluno1(this.nome, this.numero);
}

class AlunoComParametroNomeado {
  final String nome;
  final int numero;
  late final int _ano;
  AlunoComParametroNomeado({
    required this.nome,
    required this.numero,
  });

  set ano(int ano) {
    if (ano > 0) _ano = ano;
  }

  int get idade {
    var anoAtual = DateTime.now().year;

    return anoAtual - _ano;
  }
}

main() {
  // instanciando uma classe
  NomeDaClasse classe = NomeDaClasse();
  // new é opcional
  NomeDaClasse classe2 = new NomeDaClasse();

  // instanciando classe privadaa
  _NomeDaClassePrivada classe3 = _NomeDaClassePrivada();

  // chamando e inserindo valores nos atributos de minha classe
  MinhaClasse classe4 = MinhaClasse();
  classe4.nome = 'Classe com atributos';
  classe4.valor = 1;

  // chamando e inserindo valores nos atributos da classe pelo construtor
  MinhaClasseComAtributosNoConstrutor classe5 =
      MinhaClasseComAtributosNoConstrutor('Classe com atributos', 1);

  Aluno1 classe6 = Aluno1('Mateus', 27);
  print(classe6);

  var x = AlunoComParametroNomeado(nome: 'mateus', numero: 5);
  x.ano = 2001;
  print(x.idade);
}
