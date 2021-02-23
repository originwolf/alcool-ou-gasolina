import 'package:flutter/material.dart';
    
    class AlcoolGasolina extends StatefulWidget {
      @override
      _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
    }
    
    class _AlcoolGasolinaState extends State<AlcoolGasolina> {

      TextEditingController _textEditingController = TextEditingController();
      // necessário para cadastrar com o botão

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Alcool ou gasolina?"),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Digite um valor:",
                    ),
                    onSubmitted: (String e){ //definição de string obrigatória
                      print("Valor digitado: $e");
                    },
                    controller: _textEditingController, // Usado para dar a função de confirmação ao botão
                  ),
                  RaisedButton(
                    onPressed: (){
                      print("Valor digitado: " + _textEditingController.text);
                    },
                    child: Text("Cadastrar"),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    