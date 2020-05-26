// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calcController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalcController on CalcControllerBase, Store {
  Computed<int> _$resultadoComputed;

  @override
  int get resultado =>
      (_$resultadoComputed ??= Computed<int>(() => super.resultado,
              name: 'CalcControllerBase.resultado'))
          .value;

  final _$val1Atom = Atom(name: 'CalcControllerBase.val1');

  @override
  int get val1 {
    _$val1Atom.reportRead();
    return super.val1;
  }

  @override
  set val1(int value) {
    _$val1Atom.reportWrite(value, super.val1, () {
      super.val1 = value;
    });
  }

  final _$val2Atom = Atom(name: 'CalcControllerBase.val2');

  @override
  int get val2 {
    _$val2Atom.reportRead();
    return super.val2;
  }

  @override
  set val2(int value) {
    _$val2Atom.reportWrite(value, super.val2, () {
      super.val2 = value;
    });
  }

  final _$CalcControllerBaseActionController =
      ActionController(name: 'CalcControllerBase');

  @override
  dynamic actualizarValor1(String novoNumero) {
    final _$actionInfo = _$CalcControllerBaseActionController.startAction(
        name: 'CalcControllerBase.actualizarValor1');
    try {
      return super.actualizarValor1(novoNumero);
    } finally {
      _$CalcControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic actualizarValor2(String novoNumero) {
    final _$actionInfo = _$CalcControllerBaseActionController.startAction(
        name: 'CalcControllerBase.actualizarValor2');
    try {
      return super.actualizarValor2(novoNumero);
    } finally {
      _$CalcControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
val1: ${val1},
val2: ${val2},
resultado: ${resultado}
    ''';
  }
}
