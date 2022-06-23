// 1)Para atribuir um valor em um atributo, qual a diferença em:
//  (i) atribuir um valor no atributo na  definição da classe; e
//  (ii) solicitar o seu valor via parâmetro do construtor?

//    Ao atribuir valores aos atributos via construtor é preciso já possuir
//  todos os valores a serem incluídos antes de instanciar um objeto.
//    Já utilizando da atribuição direta ao atributo do objeto, é possível fazer uma
//  atribuição em qualquer momento após o objeto ja ser criado.

// 2)O que é para que ser construtor? Qual código pode-se definir nele?

//    Construtor é o primeiro bloco de instrução executado ao ser criado uma nova instancia
// de uma classe, utilizados para construir e inicializar instâncias de uma classe. Nele
// é possível receber parâmetros e executar ações como a inicialização/atribuição de variáveis de
// uma classe.

// 3)Para que serve "final"? Em que caso utilizamos? Para coletar dados, qual a vantagem e desvantagem?

//    Final é utilizado para definir uma variável/atributo que não poderá ser alterado, mas
// é inicializado em momento de execução. É utilizado quando sabemos que um valor nunca ira
// mudar mas o mesmo é inicializado apenas durante a execução.
// Com o final, o processado consegue otimizar melhor a execução do código e garante uma
// segurança para variáveis que não podem mudar. Mas após atribuído seu valor nunca poderá mudar.

// 4) Crie e instancie as classes abaixo. Para cada atributo, atribua valores,
//  altere os valores e imprima-os.
//     * → obrigatório
//     = valor (valor padrão)
//     ? pode ser nulo
//   Caso não esteja implícito, de acordo com o contexto, defina se os atributos podem ser nulos ou não e se podem ser privado ou não.
//   a) Bola{cor=branco,tamanho=7, categoria?}

class Bola {
  String cor = 'branco';
  int tamanho = 7;
  String? categoria;

  Bola(
    this.cor,
    this.tamanho,
    this.categoria,
  );
}

//   b) Professor{ id, nome, cpf, e-mail} >> inicialize todos os atributos no contrutor
class Professor {
  int id;
  String nome;
  String cpf;
  String email;

  Professor(
    this.id,
    this.nome,
    this.cpf,
    this.email,
  );
}

//   c) Aluno{ ra, nome, cpf, telefone} >> com todos os atributos final, inicialize todos os atributos no contrutor utilizando parâmetros nomeados
class Aluno {
  final String ra;
  final String nome;
  final String cpf;
  final String telefone;

  Aluno({
    required this.ra,
    required this.nome,
    required this.cpf,
    required this.telefone,
  });
}

//   d) Peça{código, nome, descrição, preço de custo}
//     → get nome e descição, get preço de venda (30% sobre o preço de custo)
//     → set código - somente números positivos
//     → set preço de custo - somente valore positivos
class Peca1 {
  late double _codigo;
  String nome;
  String descricao;
  late double _precoDeCusto;

  Peca1(this.nome, this.descricao);

  set codigo(double valor) {
    if (valor > 0) _codigo = valor;
  }

  set precoDeCusto(double valor) {
    if (valor > 0) _precoDeCusto = valor;
  }

  get nomeDescricao {
    return '$nome - $descricao';
  }

  get precoDeVenda {
    var lucro = _precoDeCusto * 0.3;
    return _precoDeCusto + lucro;
  }
}

//   e) Carro{nome, ano fabricação}
//     → get tempo de uso, get nome e ano fabricação
//     → set ano fabricação - somente ano positivo e coerente
class Carro {
  String nome;
  late int _anoFabricacao;

  Carro(this.nome);

  get tempoDeUso {
    int anoAtual = DateTime.now().year;

    return anoAtual - _anoFabricacao;
  }

  get nomeEAnoFabricacao {
    return '$nome - $_anoFabricacao';
  }

  set anoFabricacao(int ano) {
    if (ano > 1950) _anoFabricacao = ano;
  }
}

//   f) Cidade{nome,Estado{nome,sigla}}

class Estado {
  final String nome;
  final String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  final String nome;
  final Estado estado;

  Cidade({required this.nome, required this.estado});
}

//   g) Funcionario{nome, cpf, telefone, Cidade{nome,Estado{nome,sigla}}}

class Funcionario {
  String nome;
  String cpf;
  String telefone;
  Cidade cidade;

  Funcionario({
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.cidade,
  });
}

//   h) Peca{nome,
//           Tipo{nome,Categoria{nome, descirção}},
//           Unidade de Medida{sigla, descricao},
//           Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}

class Tipo {
  String nome;
  Categoria categoria;

  Tipo({
    required this.nome,
    required this.categoria,
  });
}

class Categoria {
  String nome;
  String descricao;

  Categoria({
    required this.nome,
    required this.descricao,
  });
}

class UnidadeDeMedida {
  String sigla;
  String descricao;

  UnidadeDeMedida({
    required this.sigla,
    required this.descricao,
  });
}

class Fabricante {
  String nome;
  Cidade cidade;

  Fabricante({
    required this.nome,
    required this.cidade,
  });
}

class Peca {
  String nome;
  Tipo tipo;
  UnidadeDeMedida unidadeDeMedida;
  Fabricante fabricante;

  Peca({
    required this.nome,
    required this.tipo,
    required this.unidadeDeMedida,
    required this.fabricante,
  });
}

//   i) Faça 4 classes do seu estudo de caso utilizando tudo que aprendeu hoje.
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

  // parâmetros do construtor nomeados
  // Um parâmetro obrigatório
  // Um parâmetro padrão
  Selecionado({
    required this.produto,
    this.quantidade = 1,
  }) : assert(!(quantidade >= 1), 'Valor deve ser maior que 1');

  get valorTotal {
    return produto.preco * quantidade;
  }
}

class EntradaProduto {
  DateTime date;
  List<Selecionado> _selecionados = [];

  EntradaProduto({
    required this.date,
  });

  set addSelecionado(Selecionado selecionado) {
    _selecionados.add(selecionado);
  }
}

class VendaProduto {
  DateTime date;
  List<Selecionado> selecionados;

  VendaProduto({
    required this.selecionados,
    required this.date,
  });

  get valorTotalVenda {
    double soma = 0;
    for (var e in selecionados) {
      soma += e.valorTotal;
    }

    return soma;
  }
}
