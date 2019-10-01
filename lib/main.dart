import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _infoTexto = "Informe seus dados";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoTexto = "Informe seus dados";
    });
  }

  void calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text)/100;
      double imc = weight/(height*height);

      print(imc);

      if(imc < 18.6){
        _infoTexto = "Abaixo do peso (${imc.toStringAsPrecision(3)}";
      } else if (imc >= 18.6 && imc < 24.9){
        _infoTexto = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9){
        _infoTexto = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoTexto = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoTexto = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
      } else {
        _infoTexto = "Obesidade grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: _resetFields
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green,),
            TextField(keyboardType: TextInputType.number, 
              decoration: InputDecoration(
                labelText:  "Peso (kg)",
                labelStyle: TextStyle(color: Colors.green)  
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weightController,
            ),
            TextField(keyboardType: TextInputType.number, 
              decoration: InputDecoration(
                labelText:  "Altura (cm)",
                labelStyle: TextStyle(color: Colors.green)  
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 25.0),
              child:  Container(
                height: 50.0,
                child:  RaisedButton(
                  onPressed: calculate,
                  child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  color: Colors.green,
                ),
              )
            ),
            Text(
              _infoTexto,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}