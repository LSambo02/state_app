import 'package:mobx/mobx.dart';

part 'calcController.g.dart';

class CalcController = CalcControllerBase with _$CalcController;

abstract class CalcControllerBase with Store {
  @observable
  int val1 = 0;

  @observable
  int val2 = 0;

  @action
  actualizarValor1(String novoNumero) {
    val1 = int.parse(novoNumero);
  }

  @action
  actualizarValor2(String novoNumero) {
    val2 = int.parse(novoNumero);
  }

  @computed
  int get resultado => val1 + val2;
}
