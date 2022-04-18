// (1) Criar um projeto chamado de funções;
// (2) Criar 4 arquivos: funções sem retorno e sem parâmetro, funções sem retorno e com parâmetro, funções com retorno e sem parâmetro, funções com retorno e com parâmetro;
// (3) Para cada arquivo, criar o  método show - sem retorno, sem parâmetro com um print de teste; e
// (4) Chamar o método show de cada aquivo no método main.

import 'package:aula02/funcoes_sem_retorno_e_sem_parametros.dart'
    as f_sem_retorno_sem_parametros;
import 'package:aula02/funcoes_sem_retorno_e_com_parametros.dart'
    as f_sem_retorno_com_parametros;
import 'package:aula02/funcoes_com_retorno_e_com_parametro.dart'
    as f_com_retorno_com_parametros;
import 'package:aula02/funcoes_com_retorno_e_sem_parametros.dart'
    as f_com_retorno_sem_parametros;

void main(List<String> arguments) {
  f_sem_retorno_sem_parametros.show();
  f_sem_retorno_com_parametros.show();
  f_com_retorno_sem_parametros.show();
  f_com_retorno_com_parametros.show();
}

// 										ANOTAÇÕES DE AULA

// função: bloco de instruções para realização de uma tarefa, possibilita reaproveitamento de código
//	ex: main(), print(), show()

// Top Level Function: função que não depende de uma hierarquia de classes, não necessita instanciar um objeto
// 	ex: print()

// Sintaxe:
// 	tipoRetorno nomeF([parametros]) { 	// tipoRetorno - opcional (void)
// 		... bloco de instruções
// 		return valor;					// retorno - opcional se tipoRetorno não for definido
// 	}

// tipos de funções:
//  funções sem retorno e sem parâmetro,
//  funções sem retorno e com parâmetro,
//  funções com retorno e sem parâmetro,
//	funções com retorno e com parâmetro;

// 										ATIVIDADES

// Atividade I
// Para cada variante de função que estudamos elaborar a seguinte função:
// → função calularSalario
//		- precisa do (i) valor salario e
//		- o (ii) valor do desconto.
// → Fazer o desconto somente se haver saldo. No final informar o saldo.
// ENTRADAS: salario, desconto
// RESULTADO ESPERADO: se saldo suficiente, informa-lo, caso não, informar "saldo insuficiente"

// CONCLUIDO 

// Atividade II
// Pensar em um projeto único - quanto maior o escopo melhor - possibilita pensar em vários exemplos
// Elabroar funções no escopo do projeto (autêntico)
// PROJETO TCC - Teus Controle: Sistema Computacional para Gerenciamento de uma Loja de Auto Peças (entradas e saidas)
// 		Manter registros de usuários (funcionários)
// 		Manter registros de produtos
// 		Manter registros de entradas de produtos
// 		Manter registros de saídas de produtos

// Fazer comentários de tudo que entendeu

// Elabore:
// 1) Duas funções sem retorno e sem parâmetro;
// 2) Duas funções sem retorno e com parâmetro;
// 3) Duas funções com retorno e sem parâmetro;
