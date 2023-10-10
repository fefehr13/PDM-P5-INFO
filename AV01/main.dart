// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
   String toJson() {
  Map<String, dynamic> equipeJson = {
    'nomeProjeto': _nomeProjeto,
    'funcionarios': _funcionarios.map((funcionario) {
      return {
        'nome': funcionario._nome,
        'dependentes': funcionario._dependentes.map((dependente) {
          return {'nome': dependente._nome};
        }).toList(),
      };
    }).toList(),
  };
  return jsonEncode(equipeJson);
}
}


void main() {
  // 1. Criar varios objetos Dependentes
  var dependente1 = Dependente('Márcio');
  var dependente2 = Dependente ('Taveira');
  var dependente3 = Dependente ('Li');
  // 2. Criar varios objetos Funcionario
  var funcionario1 = Funcionario('Jorge', [dependente2]);
  var funcionario2 = Funcionario('Lucas', [dependente1]);
  var funcionario3 = Funcionario('Melquizedeque', [dependente3]);
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  // 4. Criar uma lista de Funcionarios
  var funcionarios = [funcionario1, funcionario2, funcionario3];
  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  EquipeProjeto equipe_boa = EquipeProjeto('projetar_game', funcionarios);
  // 6. Printar no formato JSON o objeto Equipe Projeto.
  print(equipe_boa.toJson());
}