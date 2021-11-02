import 'dart:ui';

import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  var _corPrimaria = Colors.orange;
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    FocusScope.of(context).unfocus();
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: _corPrimaria,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(22),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                enabled: true,
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.15",
                ),
                enabled: true,
                controller: _controllerGasolina,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  textColor: Colors.white,
                  color: _corPrimaria,
                  padding: EdgeInsets.all(12),
                  onPressed: () {
                    _calcular();
                  },
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
    );
  }
}
