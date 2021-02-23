import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null) {
      print("Preço nulo");
      setState(() {
        _textoResultado = "Número inválido. Digite números maiores que 0 e utilizando (.).";
      });
    } else {
      if( (precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "É melhor abastecer com gasolina.";
        });
      } else {
        setState(() {
          _textoResultado = "É melhor abastecer com álcool.";
        });
      }
    }

    //_limparCampos();

  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina?"),
      ),
      body: Center(
        child: Container(
          //padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("images/logo.png"),
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 10),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Álcool, ex 1.59",
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex 3.15",
                  ),
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    onPressed: _calcular,
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
