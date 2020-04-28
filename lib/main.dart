import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main()
{
  runApp(MaterialApp(
    home: Home(),
  ),);
}


class Home extends StatefulWidget
{
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  TextEditingController precoGasolinaController = new TextEditingController();
  TextEditingController precoEtanolController = new TextEditingController();
  TextEditingController rendimentoEtanolController = new TextEditingController();
  TextEditingController rendimentoGasolinaController = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _info = "Informe os preços dos combustiveis!";
  
void _resetFields()
{
  precoGasolinaController.text= "";
  precoEtanolController.text= "";
  setState(() {
    _info = "Informe os preços dos combustiveis!"; 
    _formKey = GlobalKey<FormState>(); 
  });
  
}

void _calcularMelhorCombustivel()
{
  setState(() {
    double precoEtanol = double.parse(precoEtanolController.text);
    double precoGasolina = double.parse(precoGasolinaController.text);
    double rendimentoGasolina = double.parse(rendimentoGasolinaController.text);
    double rendimentoEtanol = double.parse(rendimentoEtanolController.text);
    double coeficiente = precoEtanol / precoGasolina;
    double rendimentoConsumoEtanol = rendimentoEtanol / precoEtanol;
    double rendimentoConsumoGasolina = rendimentoGasolina / precoGasolina;
    print(coeficiente);
    _info = (rendimentoConsumoGasolina < rendimentoConsumoEtanol) ? "Etanol é a melhor opção" : "Gasoliina é a melhor opção"; 
  });
  
}

  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text("Qual combustível ?"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh),
            onPressed: () {_resetFields();},)
          ],
          ),

          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.time_to_leave, size : 100.0, color: Colors.blueGrey),

              TextFormField(
                controller: precoGasolinaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Gasolina R\$",
                  labelStyle: TextStyle(color: Colors.black)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 40.0),
                validator: (value) 
                {
                  if(value.isEmpty)
                  {
                    return "Informe o preço da Gasolina!";
                  } 
                },
              ),

              TextFormField(
                controller: precoEtanolController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Etanol R\$",
                  labelStyle: TextStyle(color: Colors.black)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 30.0),
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return "Informe o preço do Etanol!";
                  }
                },
              ),

              TextFormField(
                controller: rendimentoEtanolController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Rendimento Etanol Km/L",
                  labelStyle: TextStyle(color: Colors.black)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 30.0),
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return "Informe o rendimento do Etanol!";
                  }
                },
              ),

              TextFormField(
                controller: rendimentoGasolinaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Rendimento Gasolina Km/L",
                  labelStyle: TextStyle(color: Colors.black)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 30.0),
                validator: (value)
                {
                  if(value.isEmpty)
                  {
                    return "Informe o redimento da Gasolina!";
                  }
                },
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton( 
                    onPressed: () {
                      if(_formKey.currentState.validate())
                      {
                        _calcularMelhorCombustivel();
                      }
                    },
                    child: Text("Calcular",
                                style: TextStyle(color: Colors.white, fontSize: 20.0),
                              ),
                              color: Colors.red
                ),
              ),
              ),

              Text(_info, textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 20.0),),

              Text("Informações",
              textAlign:  TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
              ],
            )
          )
        )
    );
  }
}