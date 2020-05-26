import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stateapp/mobxManager/calcController.dart';

/// UI para o MObx

class MobxCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MobxCalculator();
  }
}

class _MobxCalculator extends State<MobxCalculator> {
//  instanciar o nosso Mobx controller
  final calcController = CalcController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Do some reactive calculus"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 70,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "Valor 1"),
                        onChanged: calcController.actualizarValor1)),
                Icon(Icons.add),
                SizedBox(
                  width: 15,
                ),
                Container(
                    width: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Valor 2"),

//                      para acessar as acoes do mobx não é necesário nenhum widget especial
//                     são acessados normalmente

                      onChanged: calcController.actualizarValor2,
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
//            Para ter acesso aos dados sempre que estiverem em mudança é usado um observer que fica sempre a escutar
            Observer(builder: (_) {
              return Text(
                '${calcController.resultado}',
                style: TextStyle(fontSize: 20),
              );
            })
          ],
        ));
  }
}
