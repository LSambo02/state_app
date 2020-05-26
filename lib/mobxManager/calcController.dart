import 'package:mobx/mobx.dart';

///Não mexer o código auto-gerado
//A regra é usar o <nome do ficheiro>.g.dart
//criação (em parte) do código auto-gerado
part 'calcController.g.dart';

//criação da classe no código auto-gerado, que é um mixin na verdade

class CalcController = CalcControllerBase with _$CalcController;

abstract class CalcControllerBase with Store {
//  criação de um observable, o controller.g.dart, trata da
//   inicialização, actulização e posterior entrega na UI
  @observable
  int val1 = 0;

  @observable
  int val2 = 0;

//  A acção deve ser específica (declaractiva)

  @action
  actualizarValor1(String novoNumero) {
    val1 = int.parse(novoNumero);
  }

  @action
  actualizarValor2(String novoNumero) {
    val2 = int.parse(novoNumero);
  }

  //observable com "cálculo" (computed)
  @computed
  int get resultado => val1 + val2;
}
